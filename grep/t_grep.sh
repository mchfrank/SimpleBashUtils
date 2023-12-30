#!/bin/bash

COUNTER_SUCCESS=0
COUNTER_FAIL=0
COUNTER=0
DIFF_RES=""
echo "" > log.txt

for var in -v -c -l -n -h -o
do
          TEST1="for s21_grep.c Makefile $var"
          ./s21_grep $TEST1 > s21_grep.txt
          grep $TEST1 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          (( COUNTER++ ))
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST1"
            else
              (( COUNTER_FAIL++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST1"
          fi
          rm s21_grep.txt grep.txt

          TEST2="for s21_grep.c $var"
          ./s21_grep $TEST2 > s21_grep.txt
          grep $TEST2 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          (( COUNTER++ ))
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST2"
            else
              (( COUNTER_FAIL++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST2"
          fi
          rm s21_grep.txt grep.txt

          TEST3="-e for -e ^int s21_grep.c Makefile $var"
          ./s21_grep $TEST3 > s21_grep.txt
          grep $TEST3 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          (( COUNTER++ ))
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST3"
            else
              (( COUNTER_FAIL++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST3"
          fi
          rm s21_grep.txt grep.txt

          TEST4="-e for -e ^int s21_grep.c $var"
          ./s21_grep $TEST4 > s21_grep.txt
          grep $TEST4 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          (( COUNTER++ ))
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST4"
            else
              (( COUNTER_FAIL++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST4"
          fi
          rm s21_grep.txt grep.txt

          TEST5="-e regex -e ^print s21_grep.c $var -f pattern.txt"
          ./s21_grep $TEST5 > s21_grep.txt
          grep $TEST5 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          (( COUNTER++ ))
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST5"
            else
              (( COUNTER_FAIL++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST5"
          fi
          rm s21_grep.txt grep.txt

          TEST6="-e while -e void s21_grep.c Makefile $var -f pattern.txt"
          ./s21_grep $TEST6 > s21_grep.txt
          grep $TEST6 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          (( COUNTER++ ))
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST6"
            else
              (( COUNTER_FAIL++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST6"
          rm s21_grep.txt grep.txt
fi
done

#for var in -v -c -l -n -h -o
#do
#  for var2 in -v -c -l -n -h -o
#  do
#        if [ $var != $var2 ]
#        then
#          TEST1="for s21_grep.c Makefile $var $var2"
#          ./s21_grep $TEST1 > s21_grep.txt
#          grep $TEST1 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST1"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST1"
#          fi
#          rm s21_grep.txt grep.txt
#
#          TEST2="for s21_grep.c $var $var2"
#          ./s21_grep $TEST2 > s21_grep.txt
#          grep $TEST2 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST2"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST2"
#          fi
#          rm s21_grep.txt grep.txt
#
#          TEST3="-e for -e ^int s21_grep.c Makefile $var $var2"
#          ./s21_grep $TEST3 > s21_grep.txt
#          grep $TEST3 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST3"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST3"
#          fi
#          rm s21_grep.txt grep.txt
#
#          TEST4="-e for -e ^int s21_grep.c $var $var2"
#          ./s21_grep $TEST4 > s21_grep.txt
#          grep $TEST4 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST4"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST4"
#          fi
#          rm s21_grep.txt grep.txt
#
#          TEST5="-e regex -e ^print s21_grep.c $var $var2 -f pattern.txt"
#          ./s21_grep $TEST5 > s21_grep.txt
#          grep $TEST5 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST5"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST5"
#          fi
#          rm s21_grep.txt grep.txt
#
#          TEST6="-e while -e void s21_grep.c Makefile $var $var2 -f pattern.txt"
#          ./s21_grep $TEST6 > s21_grep.txt
#          grep $TEST6 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST6"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST6"
#          fi
#          rm s21_grep.txt grep.txt
#  fi
#  done
#done
#
#for var in -v -c -l -n -h -o
#do
#  for var2 in -v -c -l -n -h -o
#  do
#      for var3 in -v -c -l -n -h -o
#      do
#        if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ]
#        then
#          TEST1="for s21_grep.c Makefile $var $var2 $var3"
#          ./s21_grep $TEST1 > s21_grep.txt
#          grep $TEST1 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST1"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST1"
#          fi
#          rm s21_grep.txt grep.txt
#
#          TEST2="for s21_grep.c $var $var2 $var3"
#          ./s21_grep $TEST2 > s21_grep.txt
#          grep $TEST2 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST2"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST2"
#          fi
#          rm s21_grep.txt grep.txt
#
#          TEST3="-e for -e ^int s21_grep.c Makefile $var $var2 $var3"
#          ./s21_grep $TEST3 > s21_grep.txt
#          grep $TEST3 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST3"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST3"
#          fi
#          rm s21_grep.txt grep.txt
#
#          TEST4="-e for -e ^int s21_grep.c $var $var2 $var3"
#          ./s21_grep $TEST4 > s21_grep.txt
#          grep $TEST4 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST4"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST4"
#          fi
#          rm s21_grep.txt grep.txt
#
#          TEST5="-e regex -e ^print s21_grep.c $var $var2 $var3 -f pattern.txt"
#          ./s21_grep $TEST5 > s21_grep.txt
#          grep $TEST5 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST5"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST5"
#          fi
#          rm s21_grep.txt grep.txt
#
#          TEST6="-e while -e void s21_grep.c Makefile $var $var2 $var3 -f pattern.txt"
#          ./s21_grep $TEST6 > s21_grep.txt
#          grep $TEST6 > grep.txt
#          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
#          (( COUNTER++ ))
#          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
#            then
#              (( COUNTER_SUCCESS++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: grep $TEST6"
#            else
#              (( COUNTER_FAIL++ ))
#              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: grep $TEST6"
#          fi
#          rm s21_grep.txt grep.txt
#
#        fi
#      done
#  done
#done

echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"
