Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA463F4459
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 06:31:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E12653C3232
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 06:31:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A41903C2A0F
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 06:31:43 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 339831A00886
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 06:31:42 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id ADB9E9F75F;
 Mon, 23 Aug 2021 04:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1629693101; bh=hCEup8OxK9I2XZY+kJqwiS3oid1tGMncmg1BVPQkDio=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=l7JV58FBEDcmXFG4UxMugE+EYgz3CUGXojNjzSNf+cGLx+28l4PsJVGsUCHSAnRDU
 epyaFS8NIqCFINGz+bCzOVGWKqWCJZBKkgdgtU7LwGf5vBgCmjTe6clyZb/Rbzb28s
 NaZCJRstI3n34vpXfC2hMGa9EwkG9VVsozSB8nuc=
To: Petr Vorel <pvorel@suse.cz>
References: <20210812043807.3497492-1-lkml@jv-coder.de>
 <20210812043807.3497492-2-lkml@jv-coder.de> <YR+Lc8aBnK6KBOnW@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <d6443e3f-9859-82ff-7ba0-f8842cd2f437@jv-coder.de>
Date: Mon, 23 Aug 2021 06:31:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YR+Lc8aBnK6KBOnW@pevik>
Content-Language: en-US
X-Spam-Status: No, score=-0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 2/2] pec: Improve reliability
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

On 8/20/2021 1:01 PM, Petr Vorel wrote:
> Hi Joerg,
>
> I suppose this one is superseded by adding volatile by Martin's fix in
> b1e7776bf ("connectors/pec_listener: Make exit_flag volatile")
No, not at all.
The first issue is a timing issue between the event generator -> kernel 
-> pec_listener,
that cannot be fixed by a volatile, only by correct synchronization.
The second issue is also unrelated.

Martin's fix is only for the rare case, where the exit_flag could be 
optimized out by the compiler,
which would have made the event_listener run forever instead of terminating.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
