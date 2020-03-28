Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A414B196324
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Mar 2020 03:41:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DBF63C3344
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Mar 2020 03:41:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B668E3C332D
 for <ltp@lists.linux.it>; Sat, 28 Mar 2020 03:41:28 +0100 (CET)
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8B4AD6012C8
 for <ltp@lists.linux.it>; Sat, 28 Mar 2020 03:41:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=MQTBU
 zMNZwVGCNKiOk7yZo9Fw1CZjsp5HVia7zlghew=; b=AZ+1bgOb0e7plqNpRxBrl
 IXaHwGC2a/pd/ldIRSaqi1LWJapbUoW+wjdEi4STDMbImiDk9D+YV9wzp6SfRTBa
 uFB9tIbGEksgO7qdUWFdkebBF/fmrK9inSkSyWhpW8UdaFLtVegrGtOw8W4HrAj6
 w0lTttwHb0DBYddjih8E78=
Received: from [192.168.0.10] (unknown [223.64.160.247])
 by smtp13 (Coremail) with SMTP id EcCowAA3PAlPuX5eJNFPBw--.395S2;
 Sat, 28 Mar 2020 10:41:20 +0800 (CST)
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200327213924.18816-1-pvorel@suse.cz>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <4ff84a77-b858-6cae-a320-cfaed3646864@163.com>
Date: Sat, 28 Mar 2020 10:41:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200327213924.18816-1-pvorel@suse.cz>
Content-Language: en-US
X-CM-TRANSID: EcCowAA3PAlPuX5eJNFPBw--.395S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUs_MaUUUUU
X-Originating-IP: [223.64.160.247]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEhH0XlZYIKDubQAAsk
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/6] C API: .needs_cmds and SAFE_RUN_CMD()
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

On 3/28/20 5:39 AM, Petr Vorel wrote:
> + There is a double check (first in
> .needs_cmds, then in SAFE_RUN_CMD()), maybe that's not needed.

Hi Petr,

Why do you need the duplicate .needs_cmds flag?(it introduces the double 
check as you said)

Usually, all tests run commands by tst_run_cmd()/SAFE_RUN_CMD() and they 
can report TCONF

by passing TST_RUN_CMD_CHECK_CMD so it is fair to be a part of 
tst_run_cmd()/SAFE_RUN_CMD().

Thanks,

Xiao Yang



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
