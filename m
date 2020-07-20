Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED7225A10
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 10:31:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 472633C2932
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 10:31:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A9B133C223B
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 10:31:45 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 8D4381001F26
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 10:31:42 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="96610577"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 16:31:41 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 861914CE1505;
 Mon, 20 Jul 2020 16:31:37 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 16:31:39 +0800
Message-ID: <5F155667.2040305@cn.fujitsu.com>
Date: Mon, 20 Jul 2020 16:31:35 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-4-pvorel@suse.cz>
In-Reply-To: <20200710172044.21592-4-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 861914CE1505.AADDC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/7] net: Remove rsh, rcp, rlogin tests
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/7/11 1:20, Petr Vorel wrote:
> as they've been replaced by ssh/scp long time ago.
>
> As we still keep telnet test for testing basic network functionality we
> can safely drop these tests.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> New commit.
Hi Petr,

Need to remove rlogin in tcp_cmds/Makefile:
------------------------
ifneq ($(WITH_EXPECT),yes)
FILTER_OUT_SUBDIRS := ftp rlogin ssh telnet
endif
------------------------

Thanks,
Xiao Yang
> Kind regards,
> Petr
>
>  runtest/net.tcp_cmds                          |   3 -
>  testcases/network/tcp_cmds/rcp/Makefile       |  30 ----
>  testcases/network/tcp_cmds/rcp/rcp01.sh       | 144 ------------------
>  testcases/network/tcp_cmds/rlogin/Makefile    |  31 ----
>  testcases/network/tcp_cmds/rlogin/rlogin01.sh |  91 -----------
>  testcases/network/tcp_cmds/rsh/Makefile       |  31 ----
>  testcases/network/tcp_cmds/rsh/rsh01.sh       | 115 --------------
>  7 files changed, 445 deletions(-)
>  delete mode 100644 testcases/network/tcp_cmds/rcp/Makefile
>  delete mode 100755 testcases/network/tcp_cmds/rcp/rcp01.sh
>  delete mode 100644 testcases/network/tcp_cmds/rlogin/Makefile
>  delete mode 100755 testcases/network/tcp_cmds/rlogin/rlogin01.sh
>  delete mode 100644 testcases/network/tcp_cmds/rsh/Makefile
>  delete mode 100755 testcases/network/tcp_cmds/rsh/rsh01.sh
>
> diff --git a/runtest/net.tcp_cmds b/runtest/net.tcp_cmds
> index afe6d7c71..db47dfd5b 100644
> --- a/runtest/net.tcp_cmds
> +++ b/runtest/net.tcp_cmds
> @@ -11,9 +11,6 @@ host host01.sh
>  netstat netstat01.sh
>  ping01 ping01.sh
>  ping02 ping02.sh
> -rcp rcp01.sh
> -rlogin rlogin01.sh
> -rsh rsh01.sh
>  sendfile sendfile01.sh
>  tcpdump tcpdump01.sh
>  telnet telnet01.sh
> diff --git a/testcases/network/tcp_cmds/rcp/Makefile b/testcases/network/tcp_cmds/rcp/Makefile
> deleted file mode 100644
> index f8131a986..000000000
> --- a/testcases/network/tcp_cmds/rcp/Makefile
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -#
> -#    network/tcp_cmds/rcp testcases Makefile.
> -#
> -#    Copyright (C) 2009, Cisco Systems Inc.
> -#
> -#    This program is free software; you can redistribute it and/or modify
> -#    it under the terms of the GNU General Public License as published by
> -#    the Free Software Foundation; either version 2 of the License, or
> -#    (at your option) any later version.
> -#
> -#    This program is distributed in the hope that it will be useful,
> -#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -#    GNU General Public License for more details.
> -#
> -#    You should have received a copy of the GNU General Public License along
> -#    with this program; if not, write to the Free Software Foundation, Inc.,
> -#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -#
> -# Ngie Cooper, September 2009
> -#
> -
> -top_srcdir		?= ../../../..
> -
> -include $(top_srcdir)/include/mk/testcases.mk
> -include $(abs_srcdir)/../Makefile.inc
> -
> -INSTALL_TARGETS		:= rcp01.sh
> -
> -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/network/tcp_cmds/rcp/rcp01.sh b/testcases/network/tcp_cmds/rcp/rcp01.sh
> deleted file mode 100755
> index 4eaeca175..000000000
> --- a/testcases/network/tcp_cmds/rcp/rcp01.sh
> +++ /dev/null
> @@ -1,144 +0,0 @@
> -#!/bin/sh
> -#
> -#   Copyright (c) International Business Machines  Corp., 2000
> -#
> -#   This program is free software;  you can redistribute it and/or modify
> -#   it under the terms of the GNU General Public License as published by
> -#   the Free Software Foundation; either version 2 of the License, or
> -#   (at your option) any later version.
> -#
> -#   This program is distributed in the hope that it will be useful,
> -#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> -#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> -#   the GNU General Public License for more details.
> -#
> -#   You should have received a copy of the GNU General Public License
> -#   along with this program;  if not, write to the Free Software
> -#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> -#
> -#
> -#
> -#  FILE   : rcp
> -#
> -#  PURPOSE: To test the basic functionality of the `rcp` command.
> -#
> -#  SETUP: The home directory of root on the machine exported as "RHOST"
> -#         MUST have a ".rhosts" file with the hostname of the machine
> -#         where the test is executed.
> -#
> -#  HISTORY:
> -#    06/06/03 Manoj Iyer manjo@mail.utexas.edu
> -#    - Modified testcases to use test APIS and fixed bugs
> -#    03/01 Robbie Williamson (robbiew@us.ibm.com)
> -#      -Ported
> -#
> -#
> -#-----------------------------------------------------------------------
> -
> -#-----------------------------------------------------------------------
> -#
> -# FUNCTION:  do_setup
> -#
> -#-----------------------------------------------------------------------
> -
> -do_setup()
> -{
> -
> -    TCtmp=${TCtmp:-$LTPROOT/testcases/bin/$TC${EXEC_SUFFIX}$$}
> -    TCdat=${TCdat:-$LTPROOT/testcases/bin/datafiles}
> -    LHOST=`hostname`
> -    RHOST=${RHOST:-$LHOST}
> -    SLEEPTIME=${SLEEPTIME:-0}
> -    FILES=${FILES:-"bin.sm bin.med bin.lg bin.jmb"}
> -
> -    tst_setup
> -
> -    exists awk rcp rsh sum
> -
> -    if ! rsh -n -l root $RHOST mkdir -p $TCtmp >/dev/null 2>&1; then
> -        end_testcase "Remote mkdir failed"
> -    fi
> -
> -    trap do_cleanup EXIT
> -
> -}
> -
> -#-----------------------------------------------------------------------
> -#
> -# FUNCTION:  do_test
> -#
> -#-----------------------------------------------------------------------
> -
> -do_test()
> -{
> -
> -    for j in $FILES; do
> -
> -        if ! rcp $TCdat/$j $RHOST:$TCtmp/$j; then
> -            end_testcase "Failed to rcp file."
> -        fi
> -
> -        SUM1=`sum $TCdat/$j | awk '{print $1}'`
> -        SUM2=`rsh -n -l root $RHOST sum $TCtmp/$j | awk '{print $1}'`
> -        rsh -n -l root $RHOST "rm -f $TCtmp/$j"
> -        sleep $SLEEPTIME
> -
> -        if [ "$SUM1" = "$SUM2" ]; then
> -            tst_resm TINFO "rcp $TCdat/$j $RHOST:$TCtmp/$j successful"
> -        else
> -            end_testcase "FAILED: wrong sum in transfer to $RHOST"
> -        fi
> -
> -        sleep $SLEEPTIME
> -
> -    done
> -
> -    for j in $FILES; do
> -
> -        tst_resm TINFO "remote copying $RHOST:$TCdat/$j to $TCtmp/$j"
> -        if ! rcp $RHOST:$TCdat/$j $TCtmp/$j >/dev/null 2>&1; then
> -            tst_resm TFAIL "Failed to rcp file."; continue
> -        fi
> -
> -        SUM1=`sum $TCtmp/$j | awk '{print $1}'`
> -        SUM2=`rsh -n -l root $RHOST sum $TCdat/$j | awk '{print $1}'`
> -        rm -f $TCtmp/$j
> -        sleep $SLEEPTIME
> -
> -        if [ "$SUM1" = "$SUM2" ]; then
> -            tst_resm TINFO "rcp $RHOST:$TCdat/$j $TCtmp/$j successful"
> -        else
> -            end_testcase "FAILED: wrong sum in transfer to $LHOST from $RHOST"
> -        fi
> -        sleep $SLEEPTIME
> -
> -    done
> -
> -}
> -
> -#-----------------------------------------------------------------------
> -#
> -# FUNCTION:  do_cleanup
> -#
> -#-----------------------------------------------------------------------
> -
> -do_cleanup()
> -{
> -    rsh -n -l root $RHOST rmdir $TCtmp
> -    tst_cleanup
> -}
> -
> -#----------------------------------------------------------------------
> -# FUNCTION: MAIN
> -# PURPOSE:  To invoke the functions to perform the tasks described in
> -#           the prologue.
> -# INPUT:    None.
> -# OUTPUT:   A testcase run log with the results of the execution of this
> -#           test.
> -#----------------------------------------------------------------------
> -. net_cmdlib.sh
> -
> -read_opts $*
> -do_setup
> -do_test
> -end_testcase
> diff --git a/testcases/network/tcp_cmds/rlogin/Makefile b/testcases/network/tcp_cmds/rlogin/Makefile
> deleted file mode 100644
> index 1e8d10ea4..000000000
> --- a/testcases/network/tcp_cmds/rlogin/Makefile
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -#
> -#    network/tcp_cmds/rlogin testcases Makefile.
> -#
> -#    Copyright (C) 2009, Cisco Systems Inc.
> -#
> -#    This program is free software; you can redistribute it and/or modify
> -#    it under the terms of the GNU General Public License as published by
> -#    the Free Software Foundation; either version 2 of the License, or
> -#    (at your option) any later version.
> -#
> -#    This program is distributed in the hope that it will be useful,
> -#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -#    GNU General Public License for more details.
> -#
> -#    You should have received a copy of the GNU General Public License along
> -#    with this program; if not, write to the Free Software Foundation, Inc.,
> -#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -#
> -# Ngie Cooper, July 2009
> -#
> -
> -top_srcdir		?= ../../../..
> -
> -include $(top_srcdir)/include/mk/env_pre.mk
> -
> -INSTALL_TARGETS		:= rlogin01.sh
> -
> -MAKE_TARGETS		:=
> -
> -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/network/tcp_cmds/rlogin/rlogin01.sh b/testcases/network/tcp_cmds/rlogin/rlogin01.sh
> deleted file mode 100755
> index c34ab1c4e..000000000
> --- a/testcases/network/tcp_cmds/rlogin/rlogin01.sh
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -#!/bin/sh
> -#   Copyright (c) International Business Machines  Corp., 2000
> -#
> -#   This program is free software;  you can redistribute it and/or modify
> -#   it under the terms of the GNU General Public License as published by
> -#   the Free Software Foundation; either version 2 of the License, or
> -#   (at your option) any later version.
> -#
> -#   This program is distributed in the hope that it will be useful,
> -#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> -#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> -#   the GNU General Public License for more details.
> -#
> -#   You should have received a copy of the GNU General Public License
> -#   along with this program;  if not, write to the Free Software
> -#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> -#
> -#    03/01 Robbie Williamson (robbiew@us.ibm.com)
> -
> -TCID="rlogin01"
> -TST_TOTAL=1
> -
> -TST_USE_LEGACY_API=1
> -. tst_net.sh
> -
> -setup()
> -{
> -	tst_require_cmds rlogin expect
> -
> -	if [ -z $RUSER ]; then
> -		RUSER=root
> -	fi
> -
> -	if [ -z $PASSWD ]; then
> -		tst_brkm TCONF "Please set PASSWD for $RUSER."
> -	fi
> -
> -	if [ -z $RHOST ]; then
> -		tst_brkm TCONF "Please set RHOST."
> -	fi
> -
> -	if [ -z $LOOPCOUNT ]; then
> -		LOOPCOUNT=25
> -	fi
> -}
> -
> -do_test()
> -{
> -	tst_resm TINFO "Starting"
> -
> -	for i in $(seq 1 ${LOOPCOUNT})
> -	do
> -		rlogin_test || return 1
> -	done
> -}
> -
> -rlogin_test()
> -{
> -	tst_resm TINFO "login with rlogin($i/$LOOPCOUNT)"
> -
> -	expect -c "
> -		spawn rlogin $RHOST -l $RUSER
> -
> -		expect {
> -			\"Password:\" {
> -				send \"$PASSWD\r\"; exp_continue
> -			} \"incorrect\" {
> -				exit 1
> -			} \"$RUSER@\" {
> -				send \"LC_ALL=C; ls -l /etc/hosts | \\
> -				       wc -w > $RUSER.$RHOST\rexit\r\";
> -				exp_continue
> -			}
> -		}
> -	" > /dev/null || return 1
> -
> -	tst_resm TINFO "checking rlogin status($i/$LOOPCOUNT)"
> -	tst_rhost_run -u $RUSER -c "grep -q 9 $RUSER.$RHOST" || return 1
> -	tst_rhost_run -u $RUSER -c "rm -f $RUSER.$RHOST"
> -}
> -
> -setup
> -
> -do_test
> -if [ $? -ne 0 ]; then
> -	tst_resm TFAIL "Test $TCID failed."
> -else
> -	tst_resm TPASS "Test $TCID succeeded."
> -fi
> -
> -tst_exit
> diff --git a/testcases/network/tcp_cmds/rsh/Makefile b/testcases/network/tcp_cmds/rsh/Makefile
> deleted file mode 100644
> index 00ae49d8b..000000000
> --- a/testcases/network/tcp_cmds/rsh/Makefile
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -#
> -#    network/tcp_cmds/rsh testcases Makefile.
> -#
> -#    Copyright (C) 2009, Cisco Systems Inc.
> -#
> -#    This program is free software; you can redistribute it and/or modify
> -#    it under the terms of the GNU General Public License as published by
> -#    the Free Software Foundation; either version 2 of the License, or
> -#    (at your option) any later version.
> -#
> -#    This program is distributed in the hope that it will be useful,
> -#    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -#    GNU General Public License for more details.
> -#
> -#    You should have received a copy of the GNU General Public License along
> -#    with this program; if not, write to the Free Software Foundation, Inc.,
> -#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> -#
> -# Ngie Cooper, July 2009
> -#
> -
> -top_srcdir		?= ../../../..
> -
> -include $(top_srcdir)/include/mk/env_pre.mk
> -
> -INSTALL_TARGETS		:= rsh01.sh
> -
> -MAKE_TARGETS		:=
> -
> -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/network/tcp_cmds/rsh/rsh01.sh b/testcases/network/tcp_cmds/rsh/rsh01.sh
> deleted file mode 100755
> index 3968f9056..000000000
> --- a/testcases/network/tcp_cmds/rsh/rsh01.sh
> +++ /dev/null
> @@ -1,115 +0,0 @@
> -#!/bin/sh
> -#
> -#   Copyright (c) International Business Machines  Corp., 2000
> -#
> -#   This program is free software;  you can redistribute it and/or modify
> -#   it under the terms of the GNU General Public License as published by
> -#   the Free Software Foundation; either version 2 of the License, or
> -#   (at your option) any later version.
> -#
> -#   This program is distributed in the hope that it will be useful,
> -#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> -#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> -#   the GNU General Public License for more details.
> -#
> -#   You should have received a copy of the GNU General Public License
> -#   along with this program;  if not, write to the Free Software
> -#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> -#
> -#
> -#
> -#  FILE   : rsh
> -#
> -#  PURPOSE: To test the basic functionality of the `rsh` command.
> -#
> -#  SETUP: The home directory of root on the machine exported as "RHOST"
> -#         MUST have a ".rhosts" file with the hostname of the machine
> -#         where the test is executed.
> -#
> -#  HISTORY:
> -#    03/01 Robbie Williamson (robbiew@us.ibm.com)
> -#      -Ported
> -#
> -#
> -#
> -#----------------------------------------------------------------------
> -
> -do_setup()
> -{
> -
> -    FAIL_IMMEDIATELY=${FAIL_IMMEDIATELY:-1}
> -    SLEEPTIME=${SLEEPTIME:-0}
> -    NUMLOOPS=${NUMLOOPS:-1}
> -
> -    export TST_TOTAL=$NUMLOOPS
> -
> -    tst_setup
> -
> -    exists awk hostname rsh
> -
> -    RHOST=${RHOST:-`hostname`}
> -
> -}
> -
> -#-----------------------------------------------------------------------
> -#
> -# FUNCTION:  do_test
> -#
> -#-----------------------------------------------------------------------
> -
> -do_test()
> -{
> -
> -    while [ $TST_COUNT -le $NUMLOOPS ]; do
> -
> -        PASSED=0
> -
> -        if OUT=$(rsh -n -l root $RHOST 'ls -l /etc/hosts'); then
> -
> -            #
> -            # Successful output would be something of the form:
> -            #
> -            # gcooper@orangebox ~ $ ls -l /etc/hosts
> -            # -rw-r--r-- 1 root root 463 Jul  5 09:26 /etc/hosts
> -            #
> -            echo "$OUT" |
> -                awk 'BEGIN { RET=1 } NF == 9 && $NF == "/etc/hosts" { RET=0 } END { exit RET }' \
> -                > /dev/null 2>&1
> -
> -            if [ $? -eq 0 ] ; then
> -                tst_resm TPASS "rsh to $RHOST test succeeded"
> -                PASSED=1
> -            fi
> -
> -        fi
> -
> -        if [ $PASSED -ne 1 ] ; then
> -            tst_resm TFAIL "rsh to $RHOST failed"
> -            # If the first rsh failed, the likelihood that the rest will
> -            # succeed is low.
> -            if [ "$FAIL_IMMEDIATELY" = "1" ] && [ $TST_COUNT -eq 1 ]; then
> -                exit 2
> -            fi
> -        fi
> -
> -        sleep $SLEEPTIME
> -        incr_tst_count
> -
> -    done
> -
> -}
> -
> -#----------------------------------------------------------------------
> -# FUNCTION: MAIN
> -# PURPOSE:  To invoke the functions to perform the tasks described in
> -#           the prologue.
> -# INPUT:    None.
> -# OUTPUT:   A testcase run log with the results of the execution of this
> -#           test.
> -#----------------------------------------------------------------------
> -. net_cmdlib.sh
> -
> -read_opts $*
> -do_setup
> -do_test
> -end_testcase




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
