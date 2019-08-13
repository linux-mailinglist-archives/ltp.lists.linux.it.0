Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 338CF8B4A7
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 11:54:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C78E83C1CFB
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 11:54:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1831C3C1C6D
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 11:54:00 +0200 (CEST)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E47FB1000B5E
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 11:53:53 +0200 (CEST)
Received: by mail-ua1-f67.google.com with SMTP id j8so41269617uan.6
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 02:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SzpVMQth9gC3e1rXG5S5PBZgZBQRN9AZH4EZVpaGRus=;
 b=eEHsSTZFuVFRmvpsvCZUc5ZVKvS9aO9DDWoRyevUG3mDRKw4YS908H8nN3X7U47M1s
 Qe5ggoRQhjRv+mHxnnW38Szkx8BE0rDA491WlRfD6iTzArEtkfDMh6HVKDCdSb9xbude
 XaV79mLYb2bvbLFzPR6CQRhC+Mm1TrBOJDHydVRcG+kyy0SFzk9cKfEa2GX4M+qb1uni
 MOzcWH2lJg1BilkDDgdrtjWm0HC97oT1mvXCAi0mm2OnaM8apTHpAhQOq/DJLqage31s
 vyL2/mnepzs4BAqlzSo/r+kiKLd9Lyy25ynwGFKklnJZfxnXRuU1ZRE0JPw+SFXjDWdD
 tFVA==
X-Gm-Message-State: APjAAAUeK1LgJrTL2XEe/iwhAYnlL0z8oMQmvajtUop41u0ZlXbfHjSn
 Vdh6yE95nnqrQjI8Mr6w28tuq63C8vCRLxj9FugsSQ==
X-Google-Smtp-Source: APXvYqyKmb5wdg/24c/4K3wyHkAticzBegr51YAKlLzDD/at1k4BHV2oM2Kp+eimObIRa5CnOmXshrPb/n86QTtBbnQ=
X-Received: by 2002:ab0:3384:: with SMTP id y4mr8343834uap.106.1565690038858; 
 Tue, 13 Aug 2019 02:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190812143941.8119-1-chrubis@suse.cz>
In-Reply-To: <20190812143941.8119-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 13 Aug 2019 17:53:47 +0800
Message-ID: <CAEemH2daVNZM+Jf2+vooouRFfSpjWTgfT9+KneAikE5ncLys_A@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 00/11] Introduce guarded buffers
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

Hi Cyril,

I helped to compile & run the whole patch v2 on some platforms[1], the
test result looks pretty good.

Just a tiny issue was found in test_guarded_buf.c, since the .bufs
does not ending with a {}, so sometimes it gets segmental fault from:
        $ cat tst_buffers.c  -n
        115 for (i = 0; bufs[i].ptr; i++) {

And I will keep going to review the patchset in the next few days.
Will let you know if I can find more issues.

[1] (x86_64 + kernel-5.3.0-rc3), (aarch64 + kernel-4.18.0),
(rassberryPi + 4.14.78)

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
