﻿using HarmonyLib;
using MGSC;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace QM_LockItemTransfer
{
    public static class Utils
    {

        /// <summary>
        /// Returns a code matcher for the Opcode that
        /// has a local variable at the index of index, and the type of type.
        /// </summary>
        /// <param name="matcher"></param>
        /// <param name="opcode"></param>
        /// <param name="index"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static CodeMatch MatchVariable(OpCode opcode,
            int index, Type type)
        {
            return new CodeMatch((x) => 
            {
                LocalBuilder localBuilder = x.operand as LocalBuilder;
                if (localBuilder == null) throw new ArgumentException("operand is not a local builder");

                return x.opcode == opcode &&
                    localBuilder.LocalType == type &&
                    localBuilder.LocalIndex == index;
            });
        }

        public static void LogIL(IEnumerable<CodeInstruction> instructions, string fileName = null)
        {

            StringBuilder sb = new StringBuilder();
            bool useLog = fileName is null;



            foreach (CodeInstruction instruction in instructions)
            {
                string operandType = instruction.operand?.GetType().Name ?? "";

                sb.AppendLine($"{instruction.ToString()} {operandType}");
            }

            if (useLog)
            {
                if (useLog) Debug.Log("------------------------------------ Start IL");
                Debug.Log(sb.ToString());
                if (useLog) Debug.Log("------------------------------------ End IL");
            }
            else 
            {
                File.WriteAllText(fileName, sb.ToString());
            }

        }

        }


    }
