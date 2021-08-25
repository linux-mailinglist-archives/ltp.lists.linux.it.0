Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D21333F7178
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:08:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1E943C3015
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:08:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1E3AC3C2F5A
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:08:54 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 20420200D32
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:08:54 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 3BF339F750;
 Wed, 25 Aug 2021 09:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1629882533; bh=wEtvJ4FiOJJo5m9bkkiCP8/eScLOI/HfkPMNi8Cbjm0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=jGYAKYuaRhdyUQkiHJywWHsmVjC3R8TwFbwYSXOFiSHvuih67s/JB056VUlNGV5EZ
 jPr+ZjZ+NomrrntR5BlwOrqTF9slVWnTt6WG/5q+NjCCS8ixpTiRa1kVPlwb2QLH1g
 QYO8QYner1uJLf+Q/fjC7Kwz4ljdk6lBfViL+lYA=
To: Petr Vorel <pvorel@suse.cz>
References: <20210825080933.12949-1-pvorel@suse.cz>
 <20210825080933.12949-3-pvorel@suse.cz>
 <ba968568-5f0d-07f8-e5df-78f62148a3da@jv-coder.de> <YSYGrt7xn32GxeUm@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <519f189d-9219-629d-196e-29237d9417f9@jv-coder.de>
Date: Wed, 25 Aug 2021 11:08:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSYGrt7xn32GxeUm@pevik>
Content-Language: en-US
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/3] C API: Rename LTP_IPC_PATH -> TST_IPC_PATH
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

Hi Petr,

On 8/25/2021 11:00 AM, Petr Vorel wrote:
> Hi Joerg,
>
> ...
>>> NOTE: IPC is not supported in the legacy API.
>> Do you mean legacy c api here? It is supported. See old_checkpoints.h.
> Ah good, point, thanks! (include/old/old_checkpoint.h). But if I look correctly,
> LTP_IPC_PATH is not used there, right?
It uses the same code as the new implementation (tst_checkpoint.c). So 
no changes necessary,
but the commit message is misleading.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
