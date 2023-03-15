Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 741FB6BA751
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Mar 2023 06:47:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81E393CAC8A
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Mar 2023 06:47:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 325C53CA8CA
 for <ltp@lists.linux.it>; Wed, 15 Mar 2023 06:47:34 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 238C11A00881
 for <ltp@lists.linux.it>; Wed, 15 Mar 2023 06:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678859252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bU4uaaS81RdP7lMkAU/mfAj9gkw5v5DpT1u/pvn6aHg=;
 b=MJmmUI44taXUMAYYB47CYokepjEloNI+kedPGZbkBpeBCtEqzGJ2TMi0Ja75myQdEYBSyZ
 unk6G+NXViG/AT6ER3Hf3REiUQLvCVJ9roFEFNTY8VefOpH/atcEDZ+azg8LFmwPE45GaD
 TSyibztmmVW1BaDPDANMpEF32wEFrA8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-0Xll5RBoOCOsGVEOMQpl7w-1; Wed, 15 Mar 2023 01:47:30 -0400
X-MC-Unique: 0Xll5RBoOCOsGVEOMQpl7w-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay12-20020a05600c1e0c00b003ed201dcf71so3481241wmb.4
 for <ltp@lists.linux.it>; Tue, 14 Mar 2023 22:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678859249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bU4uaaS81RdP7lMkAU/mfAj9gkw5v5DpT1u/pvn6aHg=;
 b=feV9pedw+PFRe0f4UHi/jBpPIZh4FgwmEgBebO3nrXDJ9sDKwMgeeBKnGLa3qh5QFU
 so/HS7b7B26IZkjWgrlszPx0i05q1m7wppF8PSKivpVR/KmcjaNr47UB2kGUNJfq99qZ
 AZxK4HNoTR6ucTo/ND2HEMFJ9JGHMfUur45FWZLQmC4Q0qPO9aDZIixCtpdZeAHZe6bI
 O8sxey7F6wvgo92yLVNClhAWQ3bhhfNv7R4kNECd5f/sb3g9exvwF6OfInkZv+pRCaL3
 lk6/5l0apURfZKCNYOeWCE6SpqkBAN+jXFpAqWwl4FpwBiHYkd/ebar/4hbyrS4VcUch
 VeYw==
X-Gm-Message-State: AO0yUKW1eWsC02Tg8K2E44j6YcCTxp1guQCdN0bg7q8zaUtIUxfxmPmG
 MsAxgBVtBbtvRfJYmUQ0fzWnRy59A3G55iun3z4LLZV08d+ruL5eQQNDZgzVZg9u4LAQnsGuKzH
 lcv9yqtRNt1c4fcAyXSkDhgqVKrE=
X-Received: by 2002:adf:ff89:0:b0:2cf:e9de:107f with SMTP id
 j9-20020adfff89000000b002cfe9de107fmr234316wrr.7.1678859249565; 
 Tue, 14 Mar 2023 22:47:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set8clmke6hYV/iSL0Bbqz0EYBM3b6QmlUqhfGam63yC05inA+nlvL4kaMOAXxHWCv3ZVK63BBC1XkTl31eSuztU=
X-Received: by 2002:adf:ff89:0:b0:2cf:e9de:107f with SMTP id
 j9-20020adfff89000000b002cfe9de107fmr234313wrr.7.1678859249316; Tue, 14 Mar
 2023 22:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230306235715.29868-1-wegao@suse.com>
 <20230307085139.3574-1-wegao@suse.com> <87ttyo6g7o.fsf@suse.de>
In-Reply-To: <87ttyo6g7o.fsf@suse.de>
From: Li Wang <liwan@redhat.com>
Date: Wed, 15 Mar 2023 13:47:17 +0800
Message-ID: <CAEemH2de2kN6uPjzK6E-bCxuEZZXGy0Z0x4Q_uKpMDjPFo10YA@mail.gmail.com>
To: rpalethorpe@suse.de
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v5] kill01: New case cgroup kill
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Richard Palethorpe <rpalethorpe@suse.de> wrote:


> > +static void run(void)
> > +{
> > +     pid_t pids[MAX_PID_NUM];
> > +     int i;
> > +
> > +     cg_child_test_simple = tst_cg_group_mk(tst_cg,
> > "cg_test_simple");
> > +
> > +     memset(buf, 0, buf_len);
>
> IIRC guarded buffers are zeroed already.
>

The memset() is necessary since there is probably run test with '-i N'
which lead to buf[] being impacted by last time.



> > +static void setup(void)
> > +{
> > +     buf = tst_alloc(buf_len);
>
> Simple allocations like this can be done in the test struct.
>

I pointed out this before but he seems don't want to use constant
for the buf_len definition (to bypass compile error in tst_test).


-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
