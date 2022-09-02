Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 597465AABB9
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Sep 2022 11:47:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BA123CA8DB
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Sep 2022 11:47:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F62D3CA708
 for <ltp@lists.linux.it>; Fri,  2 Sep 2022 11:47:33 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 69E9E200C64
 for <ltp@lists.linux.it>; Fri,  2 Sep 2022 11:47:33 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A6A3120871;
 Fri,  2 Sep 2022 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662112052;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gQOIWWBrnZQylVy+UTP4vm1YLpIAsuRrlnxS5r4iEME=;
 b=E1LopZvDoe49wHYvyYSdfyvjOvY7nsSQVJAmYD9wxEezqxQZLSL1felaFKsxAUc6xChvuv
 v/787jqEMy1CY6wJe76YNK0QWS0oPDqTsbcIvVkEW1ZWp23lwnx188xM6Xnq/A38xyZX9v
 CKb3UiW65qHgOAaQbql5v0QkiiHv3nU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662112052;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gQOIWWBrnZQylVy+UTP4vm1YLpIAsuRrlnxS5r4iEME=;
 b=T0uNY5UYFI9d/8r8wCICQJIdUPrJuitXbT5/3uEN+uc8yGF6CTWL1Urvu4WK/pDMjsiQNp
 wTYlGXurhBOviNBQ==
Received: from g78 (unknown [10.163.24.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3600B2C141;
 Fri,  2 Sep 2022 09:47:27 +0000 (UTC)
References: <20220804121946.19564-1-pvorel@suse.cz>
 <20220804121946.19564-2-pvorel@suse.cz> <87bkry2kv8.fsf@suse.de>
 <YxHOEQwMwvhmq8Mh@pevik>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri, 02 Sep 2022 10:44:40 +0100
In-reply-to: <YxHOEQwMwvhmq8Mh@pevik>
Message-ID: <878rn2151o.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 01/10] tst_test.sh: Fix tst_mkfs() for tmpfs
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
Cc: ltp@lists.linux.it, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
>> Hello,
>
>> No response and seems reasonable, please merge!
>
>> Acked-by: Richard Palethorpe <rpalethorpe@suse.com>
> Thanks a lot for your review! I suppose you mean your ack for whole patchset.
>
> If yes, I'll merge all but the last RFC commit which needs more work (i.e.
> TST_ALL_FILESYSTEMS infrastructure although nothing uses it yet).
>
> Merging would help me not having to rebase this work after finishing and get
> merged "Track minimal size per filesystem" [1] (originally I thought that one
> would go first, but TST_ALL_FILESYSTEMS infrastructure is ready now).
>
> I also plan to convert df01.sh and mkfs01.sh to TST_ALL_FILESYSTEMS.
>
> Kind regards,
> Petr
>
> [1] https://patchwork.ozlabs.org/project/ltp/list/?series=315621

OK, I have acked everything that didn't already have a review tag. It
would help to include some test conversions in the patch set, but I
trust you will follow up with df01.sh and mkfs01.sh ;-)

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
