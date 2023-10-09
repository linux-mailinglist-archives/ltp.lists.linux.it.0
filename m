Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCF67BD76E
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Oct 2023 11:44:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35EA93C8AD8
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Oct 2023 11:44:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE5593C8964
 for <ltp@lists.linux.it>; Mon,  9 Oct 2023 11:44:43 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 70C811A0193E
 for <ltp@lists.linux.it>; Mon,  9 Oct 2023 11:44:42 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id BF5912184E;
 Mon,  9 Oct 2023 09:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696844681;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAAAWrsGHXYVfKJYQTJjrR+ut741BDviuY2zj335Bvk=;
 b=ERb4576iD74ibjBLp/dSVbEuyVl90oh8SpsT8oxGPl7TQyFrdMKO2N2w340YwisAWUFnu1
 QauWRqXhAaJ3dDv+/EX8i7smJpXFwbqcnvJw4q4enqnNRG7ua5/Cicp/BAYO/4O6v6lCA4
 gdEfx1lj5L/13qIodQYnDQ7GXw1c66U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696844681;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAAAWrsGHXYVfKJYQTJjrR+ut741BDviuY2zj335Bvk=;
 b=NVn/gCGCbiARS4cMfzhp+Af0fKR46I2ivytjvCoJTWSSw44kqueNk0IIOBTL3qC66EL+KE
 Dq4U09bPCmuCOcAw==
Received: from g78 (unknown [10.163.25.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6AC842C142;
 Mon,  9 Oct 2023 09:44:41 +0000 (UTC)
References: <20230906134452.9792-1-andrea.cervesato@suse.de>
 <20231006132514.GA214612@pevik>
User-agent: mu4e 1.10.7; emacs 29.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Mon, 09 Oct 2023 10:35:23 +0100
Organization: Linux Private Site
In-reply-to: <20231006132514.GA214612@pevik>
Message-ID: <875y3g1660.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Rewrite fork04 test
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Andrea, Richie,
>
> thanks this rewrite. There are small issues with the copyright and
> license.
>
> ...
>> +++ b/testcases/kernel/syscalls/fork/fork04.c
>> @@ -1,328 +1,93 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
> You relicenced to v2+.
>
>>  /*
>> - * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
> Removed valid copyright (although you rewrite the test, we still need to keep
> the original copyright).

OK, better safe than sorry.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
