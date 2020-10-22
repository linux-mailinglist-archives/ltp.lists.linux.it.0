Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F6295883
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 08:44:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEEAC3C318E
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 08:44:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2FA123C25E9
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 08:44:05 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id BDF941000C18
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 08:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603349043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pMTFCVNnmt9CeeiRzvGQq2fIB8iRw81smi8QL0cMFyw=;
 b=ixUWdakCAwlyFCXTo76kNLhwO+hYdxxRDuCvVrNAVQ79VH5BwjxVaKe5esoNSug2GgscMb
 rkmnGJkwqpAdAJDwTv7SMYkE4M4Gh19QrR3Hc6rlKEszSQg1G+M0r7PtlgthqUOfeIhzPU
 N7A5aXC9ddrY79RlFoU+y9FBw2YtNU8=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-7xQLhzNyOz-3aZU-c6bDgA-1; Thu, 22 Oct 2020 02:44:00 -0400
X-MC-Unique: 7xQLhzNyOz-3aZU-c6bDgA-1
Received: by mail-yb1-f197.google.com with SMTP id k7so750745ybm.13
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 23:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pMTFCVNnmt9CeeiRzvGQq2fIB8iRw81smi8QL0cMFyw=;
 b=N0RdqHspG811ACkVwr3SMlkDdOMm7xGJiSwv9icLdEmF9gwFgF/wY9Xd1Pne9xfeWP
 i90j6PhZULLa4Ac4YbnXA7HNFXjOv/wd6BiTcemFo1JpsqKSpciiXKsdRIU7gP/7I1qU
 bRuXA/90rjHBhYNQlDnoewFGwhWUAIUeNO++u8OSBqlZLaEBsQsfeus392cCvskHRF49
 uXnudcGhuoNaU3Rk0UrpRIlMbRds5y1hxQKZflDpVGwjFIe9HAYs+SI9THej5YVk4yoW
 J9vhBmL5cafkNQ3pn7uFz9QzSWOmoPCkEQTTZ6FbOmLloP6M5AduZ0/nU8wJdmn2cau8
 AbbQ==
X-Gm-Message-State: AOAM533YjbxVNT22xRfA7LLl/W1IoNS4ctsKrmmy1DwM3/bAmZRILmNc
 Kmtqdh8+U5qwq4vH1YIr2/P/W6FAJ0XbNGHoLxP3N2g/T+csg7WmafQ7kcaSLg4o2nCoXUv8TRG
 GgACE85RcfPN64AJtoY9Fj0L/1DY=
X-Received: by 2002:a25:3183:: with SMTP id x125mr1332300ybx.252.1603349040229; 
 Wed, 21 Oct 2020 23:44:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLXUwQUg/oIj20CsIBPCjKJR75Xx4xvuJOMWfrf0rseGW7RRDwZueCtJmrP6pzOGPj54osNB+okA4dP3USqzU=
X-Received: by 2002:a25:3183:: with SMTP id x125mr1332282ybx.252.1603349039956; 
 Wed, 21 Oct 2020 23:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <1603339033-8451-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1603339033-8451-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 22 Oct 2020 14:43:48 +0800
Message-ID: <CAEemH2ec2s0wJmCoNOYuMmnn6E1YJVQFid6EkVDoB8KpeC29kg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Remove ftime and sys/timeb.h
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> The two case use ftime to get the current milliseconds and it was
> used to generate random value. Use gettimeofday() to get the microseconds
> can reach the same aim.
>
> This also fixes the travis build error[1] on Fedora:Rawhide because the <sys/timeb.h>
> has been deprecated[2].
>
> [1] https://travis-ci.org/github/linux-test-project/ltp/jobs/737698948
> [2] https://www.spinics.net/lists/fedora-devel/msg279545.html
>
> Reported-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Reviewed-by: Li Wang <liwang@redhat.com>

Travis CI Passed: https://travis-ci.org/github/wangli5665/ltp/builds/737927003

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
