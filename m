Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A735F492A
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Oct 2022 20:21:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE5553CA9C7
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Oct 2022 20:21:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C24AE3C31D2
 for <ltp@lists.linux.it>; Tue,  4 Oct 2022 20:21:14 +0200 (CEST)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CAC506009F3
 for <ltp@lists.linux.it>; Tue,  4 Oct 2022 20:21:13 +0200 (CEST)
Received: by mail-pj1-x104a.google.com with SMTP id
 o15-20020a17090a0a0f00b0020ae208febfso636622pjo.5
 for <ltp@lists.linux.it>; Tue, 04 Oct 2022 11:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=iW4pO2cdRIEuqjuFF4GtYNyCHikwT2nCUw/Zr1kwBOU=;
 b=meSyGXe8cO9zID4crCfi8TFEq0K1dgLs9Voc68xNE5W+M+RBUZvOSjF5IKwI2399Am
 AMp7UFtawxoqwqQsg0jHgcjYSexTV1XcJ5Q7JDe15V2ziJbEk6aFwT/ThXBouORQzez3
 lIpyFtdMrp6ut3i5twJ2uVaek8hxLi4x2t5ORZFg/HKlj+kBH18WSIQA1IFEi6RGbZwa
 7IlCf8AE16bHF3dlYP5pEK25zPSWRykn7SgHZe7UrTNJmqaUYp1ARp5hZUk8ot5ZjKdp
 DuBsPPmoAAnTfZYvVYt+Ew/60Igxy+dSQJpxYUy/v0kDKS5u7b6UnrEAPLssTkznwV6M
 LuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=iW4pO2cdRIEuqjuFF4GtYNyCHikwT2nCUw/Zr1kwBOU=;
 b=vPwgWQ39NIkCHtCBa9dE61LkvPivBeAIeTncsSSk0qB9bmxZCgVqFUZ+rOIE+vsVoJ
 5pKNG/M5sk4pJx6HQF5HXw+JBQOo2J35F9NXP0Gq+WRssmXLMiVHwrlS5Vqv18O7stb0
 lee7PLMSXJBfL39DMaDRHJbfCJ01KBkoYJh7B69Hd7HRZm1XK3/e/8OYABA0IA5fpif/
 YtIKpAXFKpdDsYBApRfKjB8LUbyZ+JOhDgKkJTWGZuRxBl6NLpYo4cwEemzsYtwoKovM
 0HdvU0Wgj4fxG32bgOpODxz8RVky19wGIgCj4HaVJS2931pR8QlA9DrdP83vxaorVYhh
 Fkbg==
X-Gm-Message-State: ACrzQf3EXgLV8g4QbHUAQfA7NyEHI+9zmuHPUVOgeX9BpC2GdG3qAJy7
 TG9sOjbexyea5oT9mvxXv3pFXYO/GSGY7M+sy7O3QS+tvpaQJWhXJwNuRLVCGoaiASV96eny9b6
 GMFKLFkKXLdfbvcmXHKBVmO/jmxzJIpGRifA0CTcwxMkJe240zAD0X6sF
X-Google-Smtp-Source: AMsMyM4cdMfb5vE6F9a/6gboXOapmmlImdoaNNrhifcBBa4XrAPM0HdBbWd9ipS1Gn441Cc5S5fnXOJcCYg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a62:584:0:b0:55a:a7a5:b597 with SMTP id
 126-20020a620584000000b0055aa7a5b597mr28734345pff.71.1664907671958; Tue, 04
 Oct 2022 11:21:11 -0700 (PDT)
Date: Tue,  4 Oct 2022 18:20:31 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221004182040.1859774-1-edliaw@google.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/9] mmapstress01: refactor to ltp framework
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Attempt to refactor mmapstress01 to use the ltp framework.

v2->v3:
* apply make check lint suggestions
* refactor cleanup
* use SAFE_FORK
* update license

v1->v2:
* clean up formatting
* remove accidental change to header comment
* use SAFE_MMAP

Edward Liaw (9):
  mmapstress01: refactor to tst_test framework
  mmapstress01: apply make check suggestions
  mmapstress01: refactor options
  mmapstress01: use FILE_OFFSET_BITS=64
  mmapstress01: use safe macros
  mmapstress01: refactor cleanup and drop leavefile option
  mmapstress01: use SAFE_FORK
  mmapstress01: update license
  mmapstress01: reorder vars and functions

 testcases/kernel/mem/mmapstress/Makefile      |   2 +
 .../kernel/mem/mmapstress/mmapstress01.c      | 845 ++++++------------
 2 files changed, 289 insertions(+), 558 deletions(-)

-- 
2.38.0.rc1.362.ged0d419d3c-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
