Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 663077CD555
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Oct 2023 09:12:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB9E63CD0A4
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Oct 2023 09:12:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0707D3C85BA
 for <ltp@lists.linux.it>; Wed, 18 Oct 2023 09:12:15 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 40A5D1401246
 for <ltp@lists.linux.it>; Wed, 18 Oct 2023 09:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697613133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tkeLbs53CKlqbSmWsmFJKQiIPUpt30EcCP6/D6laKEM=;
 b=cn/uqfutNqPmHTzWsQRqn4ClAUMlc7dIgiyFAL40tw+BnQi15A+0K6KLD6qcgGv7g4v7/0
 cEl4XeJcFfLK9r3fuQxdZHqqlHXlt+MrXIVjxn8SspkQkf6uOaQuDMPHVjmFPGxufof7eL
 a7wP8budmhxdKTgRQ5SPviEGz+oXjuQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-NoC0iePDPuCMyNOIcFpYqA-1; Wed, 18 Oct 2023 03:12:01 -0400
X-MC-Unique: NoC0iePDPuCMyNOIcFpYqA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-50433324cf3so6684871e87.3
 for <ltp@lists.linux.it>; Wed, 18 Oct 2023 00:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697613120; x=1698217920;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tkeLbs53CKlqbSmWsmFJKQiIPUpt30EcCP6/D6laKEM=;
 b=B7L7fr9Pr/djjzjoCZyJUgpRZRxw/erJ9bY+KLHffkUZCEei4AYuXFffOsIlHqk0q1
 npxOwWWokfKXpZ7rGoExZFh4PuMj4RLmKMGMmoKaI8ZCI2/TBQ79zl2b+3qXcvXKjW8m
 KP6+WOvW/y2ul1f3am4jSZQnqjPQggzJI5eG9QnY5kFaxPdBtHAZyza22oTZ0pzRdKWl
 JIfRW5b0GWk7Fv26EesLg/142/yr9hoOWFRYvmfwbN8iaTRhXNYMeb8i3J2/daqNG56Y
 R/+sta7j3nhUieImqgidPVXg4wzkzxVQnDEoYtp9RhQoOF6vC9cnGsrzuyhp3Hs6GqJI
 QEQw==
X-Gm-Message-State: AOJu0YwNuNHi1jX5z6rA369TjUtEv1CvOIGKfUdUNAjR2YxtOyEeFzsO
 ZvH3kgvlbi5SOZKlP5QxWnC2qunCxqqSJqflXoHIFqogtmo/ckUEY3p75uyY0vyA3JJPnhcJOb8
 W41k8Yvcf/d9RKKb1hmH0O+hlnR4=
X-Received: by 2002:a05:6512:33ca:b0:507:a001:792e with SMTP id
 d10-20020a05651233ca00b00507a001792emr4151384lfg.46.1697613120086; 
 Wed, 18 Oct 2023 00:12:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbN+6C7OE9LPpd6T54hBrUvL7bwCSdddtj/3AFSno2nN72WY8SSSGDOippF4eBP6UhNesqLdXG79FsqIIvFkY=
X-Received: by 2002:a05:6512:33ca:b0:507:a001:792e with SMTP id
 d10-20020a05651233ca00b00507a001792emr4151362lfg.46.1697613119721; Wed, 18
 Oct 2023 00:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231016184408.879977-1-pvorel@suse.cz>
In-Reply-To: <20231016184408.879977-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 18 Oct 2023 15:11:47 +0800
Message-ID: <CAEemH2evv9t8+revtiYRWG3g9BujucnrJN_W8MCoXnC84ED1dQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [RFC PATCH 0/7] Remove scsi testsuite + various
 testscripts
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgMjo0NOKAr0FNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6PiB3cm90ZToKCj4gSGksCj4KPiBjbGVhbnVwIG9mIDIgb2xkIHNjc2kgdGVzdHN1aXRlcyBh
bmQgc29tZSBvZiBsZWdhY3kgdGVzdHNjcmlwdHMuCj4gSU1ITyB0aGUgdGVzdHN1aXRlcyBhcmUg
bm90IHdvcnRoIG9mIGZpeGluZy4KPgoKVGhhbmtzIGZvciB0aGUgY2xlYW51cCB3b3JrIQoKUmV2
aWV3ZWQtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgoKLS0gClJlZ2FyZHMsCkxpIFdh
bmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
