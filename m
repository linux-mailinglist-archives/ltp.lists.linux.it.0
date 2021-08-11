Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7303E946D
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 17:19:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB6EA3C701D
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 17:19:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 956C03C0F90
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 17:19:47 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 03C9F1000540
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 17:19:46 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 92B119F75E;
 Wed, 11 Aug 2021 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1628695185; bh=G36yjaDUQq6Nra1UENLjv5GjBmtPLv17SPgptsq7C+0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=l6+fWMpVJQle7Cl5cEw56JVb2OIXsrQ7374OtQkxRLLZXTmFTj0A23KB+hYcQgnyJ
 t/B5GfF2cZp4xfgw6StmcY4r2cpuFyQzGcSWboWTBAsZov6ktckIcG3RY159KvK9Sv
 gCoOCkvEsLdPRTdfKBCKEnoJvO3b97yQg11cPps0=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210809121238.1585673-1-lkml@jv-coder.de> <YRPGHBuKHnvARkn+@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <e8325b2c-36b3-a865-d48a-7ad5a8a095cb@jv-coder.de>
Date: Wed, 11 Aug 2021 17:19:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRPGHBuKHnvARkn+@yuki>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] shell: Add checkpoints api for new lib
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

On 8/11/2021 2:44 PM, Cyril Hrubis wrote:
>
>> +_tst_init_checkpoints()
>> +{
>> +	local pagesize
>> +
>> +	LTP_IPC_PATH="/dev/shm/ltp_${TCID}_$$"
>> +	pagesize=$(tst_getconf PAGESIZE)
>> +	if [ $? -ne 0 ]; then
>> +		tst_brk TBROK "tst_getconf PAGESIZE failed"
>> +	fi
>> +	ROD_SILENT dd if=/dev/zero of="$LTP_IPC_PATH" bs="$pagesize" count=1
>> +	ROD_SILENT chmod 600 "$LTP_IPC_PATH"
>> +	export LTP_IPC_PATH
>> +}
> Shouldn't we also delete the /dev/shm/ltp_${TCID}_$$ in the
> _tst_do_exit() if LTP_IPC_PATH was set?
You are right of course... I was in a tst_tmpdir mindset when 
implementing it, sorry.
I'll send a v2
>
> Other than that it looks fine.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
