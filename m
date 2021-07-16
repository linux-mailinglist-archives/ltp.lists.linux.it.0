Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D66A3CB2D0
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 08:43:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34AB43C65B4
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 08:43:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6F2E23C65B4
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 08:43:06 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AF5B52010F3
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 08:43:05 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 3B2DEA048B;
 Fri, 16 Jul 2021 06:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1626417783; bh=3JJI7EKqFDUcjfcGmCeGlc3jgW9xqUgMKGS9Xif7TZ0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=Jf+OnnSIEghtghz3oA3YER67UZYLdttbCh+6Vkoj/4neWPIx+xWFa/enOXDBQlLc8
 EjQM4bDLEviybS7EAIiVWIASbiiXQNrr2oenOZBISSBuGVV/WSHdNn63EW9iseL/UY
 GIhcpeCjH0FdPA7Y70TNpY3ZkuRwTWlVlUwvmZ+s=
To: Boyang Xue <bxue@redhat.com>, ltp@lists.linux.it
References: <CAHLe9YYCDFxqoaciAcz4Ec9bU7cQPJM9SDL2_4ygjcaWx967-A@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <48573d84-20e4-11a1-6306-d82b6ada6efd@jv-coder.de>
Date: Fri, 16 Jul 2021 08:43:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHLe9YYCDFxqoaciAcz4Ec9bU7cQPJM9SDL2_4ygjcaWx967-A@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [question] tst_rhost_run.sh not installed
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Sorry for the duplicate, I forgot to add the mailing list...

On 7/16/2021 8:13 AM, Boyang Xue wrote:
> Hi,
>
> I'm trying to build, install and run LTP like this:
> ```
> git clone https://github.com/linux-test-project/ltp.git repo_ltp
> pushd repo_ltp/
> make autotools
> ./configure
> make
> make install
> # export RHOST, LHOST, etc. test vars
> export LTPROOT=/opt/ltp; export PATH=$LTPROOT/bin:$LTPROOT/testcases/bin:$PATH
> ./runltp -d /test -f net.nfs
> ```
>
> During the test run, it complains that
> ```
> /opt/ltp/testcases/bin/tst_net.sh: line 979: bash:: command not found
> ```
> line#979 is:
> ```
> eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV4_RHOST || echo "exit $?")
> ```
>
> I can find tst_net_iface_prefix in the $PATH, so it should be
> tst_rhost_run which leads to the error.
> Searching for tst_rhost_run in /opt/ltp and $PATH shows not found, so
> is it a bug or did I miss something that the file wasn't installed?
No tst_rhost_run is a shell function defined in tst_net.sh.
I guess the problem is your RHOST setup.
LTP supports two setups for network tests:
1. network namespace based. This is used if you don't set RHOST and LHOST.
2. Two-host setup, where RHOST points to a second host.

The important thing in two host setup is, that $LTP_ROOT/testcases/bin 
is in the PATH for the user, that is used on the RHOST.
I guess what happens in your setup is that tst_net_iface_prefix is not 
found on the RHOST, because it is not in the path.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
