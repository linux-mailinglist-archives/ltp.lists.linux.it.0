Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF6D3C8512
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 15:15:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23E993C8651
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 15:15:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 47E703C180D
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 15:15:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8502A140115A
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 15:15:50 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 03A2822A1F
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 13:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626268550;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3xA/LV+yd01Ci5kPv4+d/HU/WoiN4LhpySU+dSIMW0w=;
 b=zoh7AEU05TdroVrMEWfI5V69sL3a3UfoSm2/0n0HDPvGu+3BEsnJruw+o7IAfmdh2Lzx1O
 mqysOxq+iYa6VBZJlVeF2vbvUvC5N5tqz2c9AN7YhITdUTwny+gA0KN7Zf6+xe//2GO3hR
 GpxASLCWP4DrJCffUs4gETd2v/3AfPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626268550;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3xA/LV+yd01Ci5kPv4+d/HU/WoiN4LhpySU+dSIMW0w=;
 b=OMfEBPFZaWxTZ+nrdhLNEONMXD/FbK079MOBvTcH3VZwGN7oV8ELDFA7dC97YpEXo1+C1I
 x/b9Ah6YXGdd4WBA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C75E9A3B8A;
 Wed, 14 Jul 2021 13:15:49 +0000 (UTC)
References: <20210714071158.15868-1-rpalethorpe@suse.com>
 <20210714071158.15868-4-rpalethorpe@suse.com> <YO7BQjUuCP3ah5wu@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YO7BQjUuCP3ah5wu@pevik>
Date: Wed, 14 Jul 2021 14:15:49 +0100
Message-ID: <87v95dniii.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/8] doc: Add rules and recommendations list
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

Hello Petr,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
> obviously correct.
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
>> +++ b/doc/test-writing-guidelines.txt
>> @@ -10,6 +10,11 @@ NOTE: See also
>>        https://github.com/linux-test-project/ltp/wiki/Shell-Test-API[Shell Test API],
>>        https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines[LTP Library API Writing Guidelines].
>
>> +Rules and recommendations which are "machine checkable" should be
>> +tagged with an ID like +LTP-XXX+. There will be a corresponding entry
>> +in 'doc/rules.tsv'. When you run 'make check' or 'make check-test' it
> nit: I'd make 'doc/rules.tsv' as link (for lazy people like me):
> https://github.com/linux-test-project/ltp/tree/master/doc/rules.tsv[doc/rules.tsv]

+1

Although I was wondering if it could be formatted and displayed inline somehow?

>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
