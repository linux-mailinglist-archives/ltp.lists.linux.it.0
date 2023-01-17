Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F1566DBCC
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Jan 2023 12:05:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 137973CC8CF
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Jan 2023 12:05:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7D8943C526E
 for <ltp@lists.linux.it>; Tue, 17 Jan 2023 12:05:29 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D6B616008A1
 for <ltp@lists.linux.it>; Tue, 17 Jan 2023 12:05:28 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E3F36383FC;
 Tue, 17 Jan 2023 11:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673953527;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r/T7LZZ7EkWqMHp7yklGp1I3OctFoPTot6xgsrPoNJI=;
 b=sK0ZzGywHOWpsR/3DwZ0/mcUMG1RX7SHSka4ipCQAvI1hWazdg7scdxUS7qHSrKpAIY4Lm
 2sZ4IvshQfxG+O9XPvV1vR2WtGbp5aEehIEKqilgbZs4T+3Ym8fI9/ddpeWgdZeZkLItsD
 2JVj3n5NcLrxF4cP3+2f8E9a1RVBAPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673953527;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r/T7LZZ7EkWqMHp7yklGp1I3OctFoPTot6xgsrPoNJI=;
 b=iwnbMe6af2+YJ8deCfE3jVqWuawPaQuEC9zqw5yYXMKLmnMb12nFD2F7+9Pf/bEkf6OcJa
 6rpMga4pcFcFDeBA==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id AEDBB2C141;
 Tue, 17 Jan 2023 11:05:27 +0000 (UTC)
References: <Y8VRpdW7LUh4uFm9@yuki> <87bkmywlb7.fsf@suse.de>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 17 Jan 2023 11:02:40 +0000
Organization: Linux Private Site
In-reply-to: <87bkmywlb7.fsf@suse.de>
Message-ID: <873589whe2.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: Andrea Cervesato <acervesato@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Richard Palethorpe <rpalethorpe@suse.de> writes:

> Hello,
>
> Cyril Hrubis <chrubis@suse.cz> writes:
>
>> Hi!
>> It's about the time to start preparing for the LTP January release. Well
>> we should have started at least a week ago, but my family was sick and
>> nobody else seemd to start to work on that...
>>
>> Anyways let's start with listing patches that should be considered for
>> the release, looking at patchwork the queueu is nice and short so I
>> suppose there will not be many and that we can start with pre-release
>> testing now and do a git freeze at the start of the next week. Does that
>> sound reasonable?
>>
>> Also are there any volunteers for picking up various release tasks?
>>
>> -- 
>> Cyril Hrubis
>> chrubis@suse.cz
>
> My fix for fcntl36/34 doesn't seem to fully work for fcntl36 on 32bit
> compat. Hopefully I can fix that before next week.

Actually these tests are fine. The problem is the OpenSUSE package is
broken due to the runltp-ng Makefile. So we should fix that instead.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
