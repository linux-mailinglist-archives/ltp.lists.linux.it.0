Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 144ED192C43
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 16:24:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 956A13C4BB2
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 16:24:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A46203C2312
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 16:24:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C9294600678
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 16:24:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E9722AD07;
 Wed, 25 Mar 2020 15:24:19 +0000 (UTC)
Date: Wed, 25 Mar 2020 16:24:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: gengcixi@gmail.com
Message-ID: <20200325152418.GA23610@dell5510>
References: <20200324121742.7130-1-gengcixi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324121742.7130-1-gengcixi@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] uart: add uart testcase in kernel
 device-drivers
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Orson Zhai <orsonzhai@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cixi,

...
> +++ b/testcases/kernel/device-drivers/uart/serialcheck.sh
> @@ -0,0 +1,68 @@
> +#!/bin/sh
> +###############################################################################
> +#
Please avoid these '####...'

> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
> +# Copyright (C) 2019, Unisoc Communications Inc.
> +#
> +# Test UART ports using git://git.breakpoint.cc/bigeasy/serialcheck.git
> +#
> +###############################################################################
> +
> +TST_TESTFUNC=do_test
> +TST_POS_ARGS=3
> +TST_USAGE=usage
> +TST_NEEDS_ROOT=1
> +TST_NEEDS_CMDS="serialcheck"
> +TST_NEEDS_CMDS="lsof"
> +TST_NEEDS_CMDS="dd"
Note, this is a normal shell variable, so you'd request only dd. You need to
use:
TST_NEEDS_CMDS="serialcheck lsof dd"

> +TST_NEEDS_TMPDIR=1
> +
> +. tst_test.sh
> +
> +usage()
> +{
> +    echo "usage: ./${0} [-r UART_RATE] [-l LOOPS] [-h|k to enable HW flow control or loopback]"
> +    exit 1
> +}
BTW, you use positional arguments, so this help is wrong.
IMHO it's better to use getopts parameters (positional parameters are rarely
used + use "k" as a parameter looks strange), but of course it's not a
mistake. If you want to keep them, it should be:

usage()
{
    echo "usage: $0 {UART_RATE} {LOOPS} {h|k to enable HW flow control or loopback}"
}

The convention in unix/linux program is:
[ foo ] => foo is optional argument
{ bar } => bar is mandatory argument

> +
> +UART_RATE=$1
> +UART_LOOPS=$2
> +UART_HWFLOW=$3
> +
> +create_test_file()
> +{
> +    temp_test_file=`mktemp`
We both Cyril and me mentioned that you don't need to use mktemp (+ it'd be
unnecessary dependency).

> +    dd if=/dev/urandom of=$temp_test_file count=1 bs=$((UART_RATE / 2))
> +}
> +
> +test_serial()
> +{
> +    create_test_file
> +    { sleep 1; serialcheck -b $UART_RATE -d $1 -f $temp_test_file -l $UART_LOOPS -m t -${UART_HWFLOW}; }&
Cyril already mentioned the need to use proper locks instead of sleep.
> +    PID=$!
> +    serialcheck -b $UART_RATE -d $1 -f $temp_test_file -l $UART_LOOPS -m r -${UART_HWFLOW}
> +    if [ $? ];  then
This is always true. Use either:
serialcheck -b $UART_RATE -d $1 -f $temp_test_file -l $UART_LOOPS -m r -${UART_HWFLOW}
if [ $? -eq 0 ];  then
...

or put the command itself into if:

if serialcheck -b $UART_RATE -d $1 -f $temp_test_file -l $UART_LOOPS -m r -${UART_HWFLOW}; then
...

> +        kill -- -$PID 2>/dev/null
> +        tst_res TFAIL "uart test failed"
> +    else
> +        tst_res TPASS "uart test passed"
> +    fi
> +    rm $temp_test_file
> +}
> +
> +do_test()
> +{
You re supposed to declare non-global variables:
local i

> +    for i in /sys/class/tty/*/uartclk ;do
> +        PORT=`echo $i |cut -d '/' -f 5`
> +        # Activate port in case it will be initialized only when startup
> +        echo "UART TESTING">${PORT} 2>/dev/null
> +        if [ `cat /sys/class/tty/${PORT}/uartclk` -ne 0 ]; then
> +            lsof | grep "/dev/${PORT}" &> /dev/null || PORT_TO_TEST="/dev/${PORT}"
> +            tst_res TINFO "start test on ${PORT_TO_TEST} ${UART_RATE}"
> +            test_serial ${PORT_TO_TEST}
> +        fi
> +    done
> +}
> +
> +tst_run

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
