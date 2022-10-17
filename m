Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1185D6010E4
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Oct 2022 16:16:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B12233CAFF7
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Oct 2022 16:16:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7FEE13C2E4F
 for <ltp@lists.linux.it>; Mon, 17 Oct 2022 16:16:13 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0A632600096
 for <ltp@lists.linux.it>; Mon, 17 Oct 2022 16:16:12 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EC20934122;
 Mon, 17 Oct 2022 14:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666016171;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ew2AxovpR7m1edm9/IcRzxQ1ww6dLZYKoM5poaGKrjM=;
 b=Ib+J/Wx1CbOh+fNvTru1kJpLY4QpQGaW4GeNkF6rfg5lDQ4vSsEMrgeD2NS/zrFlCZJtIJ
 xUEOsddeKsX7gvt50Cb9+llDZ+dZ3PwDgRK+0gijhRIN7x5/2okEvtj9wXB3SL71QqXhSr
 ROsEtMiK6L8JoxnZ4ZWGZXDh+WqbJho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666016171;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ew2AxovpR7m1edm9/IcRzxQ1ww6dLZYKoM5poaGKrjM=;
 b=EbvfQUMjp0PpAQIIVkwNOeaOoLRomBXim6v7xNHMrNzhpMp5SQhnKqoGPQCm7NIexqzyq4
 L+yswGUU6X+hzeCg==
Received: from g78 (unknown [10.100.228.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 300012C141;
 Mon, 17 Oct 2022 14:16:11 +0000 (UTC)
References: <43d65409eb3290b09e1c3a21cb0dc079c5f4849c.1664801307.git.jstancek@redhat.com>
 <938c864ee6bb82ffdee9371bd802642ffedc606c.1664872194.git.jstancek@redhat.com>
 <Yz1PQEvpLBQg3313@yuki>
 <CAASaF6wbO4hCsqXQ2zmym75DvtWDN=2hLDHUkYRnDcy2xsiBjQ@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Jan Stancek <jstancek@redhat.com>
Date: Mon, 17 Oct 2022 15:15:21 +0100
In-reply-to: <CAASaF6wbO4hCsqXQ2zmym75DvtWDN=2hLDHUkYRnDcy2xsiBjQ@mail.gmail.com>
Message-ID: <87wn8ymt7a.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib: introduce safe_write() retry
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

Jan Stancek <jstancek@redhat.com> writes:

> On Wed, Oct 5, 2022 at 11:31 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>>
>> Hi!
>> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
>
> Pushed with Petr notes about comments and whitespace fixed.
>
>>
>> --
>> Cyril Hrubis
>> chrubis@suse.cz
>>

I have set this to accepted in patchwork. Please update patchwork when
merging something.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
