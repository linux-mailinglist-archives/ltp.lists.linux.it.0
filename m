Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A38B36D16A
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 06:47:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A52213C627C
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 06:47:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 50D7F3C1A7E
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 06:47:30 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1D16E600A58
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 06:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619585248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oh9nyraDqseWtgFI9ROMQgiTFAec+mbtMaHsK6Yckog=;
 b=I4CwLI9Y6lygtIskbcltFl5e5rNE9dw2t2x6zcnRZZIlcTJgicNBugwKmfxl6q0I+T7P3K
 cMLAYweagCSh507OlU0X/tUaj4qC5XBaPa2nlH9RUGygr754l9KBnmlEMqwubKG3adk6Vq
 mJy4+q9LyVk/0yWe3ZjF0m19Lpd/SNA=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-f3D1QTqwNfGS3-0QFslZcQ-1; Wed, 28 Apr 2021 00:47:26 -0400
X-MC-Unique: f3D1QTqwNfGS3-0QFslZcQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 i201-20020a25d1d20000b02904ed4c01f82bso18211073ybg.20
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 21:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oh9nyraDqseWtgFI9ROMQgiTFAec+mbtMaHsK6Yckog=;
 b=qapaH3Dk3Y+RmZkgmi7tM6bVE2JD1Uw5MXIVuwnhk56y7aKVleLq1QXu5XrzxImhkv
 S63FoER6uStR698RdbuMCE3V69mOkrgGReM5ReAOPi25tNoUAfwxNPfkC1mX7uj2IfaB
 G5NdUNvr9FIIngWIz8VQA65RzjoEM4Fu4EzqvmvCh9UElUrCitTXXhJWuEEzq6M/yihA
 wLW7DdsT0QOWjVfTcSlaIByGpho31mr+jY0CtshptL/MIu2Rt71W0ZjFaRc3nNMTab43
 Ts3mQuSnfsY0/9crGerDFVld5loiqCwJsUli8ISrh47iMXYmv3+nOSSYM4EeQ7ictWjg
 kwTw==
X-Gm-Message-State: AOAM531eOdjWutPhc3AfmtSPtz3w60Ncfnu9Ww3zG7lLvXyCaAEuhuQu
 vcm6axw4O95wN1jOMIFndUwA4jLSnZxTuI/BUWukS1NbPnmP9y6oc4j98sjFYQ5SNYPKuPDws0J
 975+gqlNXl+gSx/OiosOOv/0P18A=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr37474009ybg.86.1619585245911; 
 Tue, 27 Apr 2021 21:47:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIPmc8y27h/PI6r9z3pG1ZI+RrHy1hk1XEDblUtlHKYBA0mZAZ7OM6aR5NDQecgwEOTx2e0fWEiAoDDVtPTs8=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr37473994ybg.86.1619585245693; 
 Tue, 27 Apr 2021 21:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <1619580848-99507-1-git-send-email-wangxin410@huawei.com>
In-Reply-To: <1619580848-99507-1-git-send-email-wangxin410@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 28 Apr 2021 12:47:14 +0800
Message-ID: <CAEemH2cnez2nspV5O3P4Qen-3HxqceHZCAAeL4YgJ+M8oeGB2w@mail.gmail.com>
To: Wang Xin <wangxin410@huawei.com>, Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] openposix/conformance/interfaces: Correct typos
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

Wang Xin <wangxin410@huawei.com> wrote:

>
> Types in the name of the temporary files: For example, in aio_cancel/8-1.c file,
> pts_aio_cancel_1_1 -> pts_aio_cancel_8_1.
> Others like this have been modified.

Applied, thanks for this fix.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
