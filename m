Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1310C3F7101
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 10:18:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEB303C304E
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 10:18:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2C47C3C2FB4
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:18:27 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BD564623492
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:18:26 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id E10CA9F750;
 Wed, 25 Aug 2021 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1629879506; bh=JGf1JqzOC6Cz3s+wegq96WZf4T3MHmm+GxNI+zUrdpk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=vA9kw6lzeGHF0pfdLQhyJT8rBQ8cuWO1b8mX5QnFLPzk3DSMvOEqqATz00/koNtyV
 7ZFkVgVGsSxcReP+qcDGFhwbmigSDfC4OvLutp1Okh8m78EqGZ/HBr4SkFIpgNNuHS
 iAWQVopTdhRyvzuYOFqeHdNuCFxgXf5RyGqFqzmQ=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210825080933.12949-1-pvorel@suse.cz>
 <20210825080933.12949-4-pvorel@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <8d74045f-3ebc-526d-f875-6ca121475a4d@jv-coder.de>
Date: Wed, 25 Aug 2021 10:18:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825080933.12949-4-pvorel@suse.cz>
Content-Language: en-US
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 3/3] shell API: Rename LTP_IPC_PATH -> TST_IPC_PATH
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On 8/25/2021 10:09 AM, Petr Vorel wrote:
> To follow the conventions in the new API.
>
> Keep the old name in the legacy API.
That doesn't make sense. If you update the variable name in the c api, 
you also have to update the old shell api (i.e. test.sh).
Or maybe even remove the code from the old shell api completely. As far 
as I see there are no users of the checkpoint api anymore.
Both tests (cn_pec and memcfg/functional) were rewritten. It is probably 
safe to just drop the old api?

Joerg


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
