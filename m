Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8213B649AD5
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 10:13:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4048D3CBE16
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 10:13:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A65E33C264E
 for <ltp@lists.linux.it>; Fri,  9 Dec 2022 20:43:13 +0100 (CET)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 736D41400558
 for <ltp@lists.linux.it>; Fri,  9 Dec 2022 20:43:12 +0100 (CET)
Received: by mail-qt1-x830.google.com with SMTP id j16so4408569qtv.4
 for <ltp@lists.linux.it>; Fri, 09 Dec 2022 11:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gRJTs9+SBroSyGvMtmVyKnEau+bQZUBWgY31sFvqRjc=;
 b=aadxeURzQ02Z751ZmBMRvCNvyXkPhfztoKWIQTV8AsbVK7Cajwkt4uqlvYc/LHMlck
 PHhH+Kt9SynLakKvLgC5Ut5QzrVoJzud2hzZplz2YCa6M0UN+QjGb14oPs9dpuftm2ho
 b/dCNLfO/N5sIefkqpqj4RjmH03UJFb6JN87VZQ5Fs8vlKVKnrbpJRKlgMve5RMveUEG
 XkN0GbzAIookuc3+sZ8i1ydm3n3+lZdf/Y0bY1aNvdQZIPVU7yoR9mSd8TkUeMNM1Aik
 XJQ1QdM1t2YLx2rvH2Qfw5a+GQKGWiAqV3jSkViMIVWz49j3RhV/i6NPVLy4JhjpC2mQ
 S3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gRJTs9+SBroSyGvMtmVyKnEau+bQZUBWgY31sFvqRjc=;
 b=UMaDFHfbaby1KwwtIzAYzuX0V7CDZMnM+od9u+Eygxl2gCBHCO+CNOehf4wHpiCz/3
 RHNkUAO28OL+eplbIj4jBtIyfJM3SeBgMbmNPnR5CudNXDD4c4zl5YXgEogQWQbX7YZb
 JUER7AiJCBJGsLRClIOS/99gQDWLfKO29fGRJkFTE9gDwmghDTp/j2i0ZrQaYkkIZ3hI
 BUjbWffoJjx9OhgW7mTt4rqT/uu4epzhBcjEBe9urxYMGgwBVUHEKdsKOGYJon2lJGne
 3WOregAsLQaRhDEOJBRNa2xYBNJ8KUClm2bJR5JkWdLIndt+hLb2envbmq/z1zXbpM7Y
 rkFw==
X-Gm-Message-State: ANoB5pkxVEAV+1Tha9w1WjIITUCzYO4BPhiEGI/N7NDFEM/lZrtn/B7R
 IlxtiUxzL2CuZ5aajeZAuwCzFE89LVNZGnSdW06D1lFX49G8Qw==
X-Google-Smtp-Source: AA0mqf6ogKC62ZUB5vRz6IJK6TjT4VitJ7n06+dN4VijzL5htPSrTRrxgLXds07Sj4nRvbhOysXSop10oJMTJlf+CPY=
X-Received: by 2002:ac8:5055:0:b0:3a5:3388:4135 with SMTP id
 h21-20020ac85055000000b003a533884135mr76264994qtm.129.1670614989423; Fri, 09
 Dec 2022 11:43:09 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 9 Dec 2022 11:42:58 -0800
Message-ID: <CAELULbe=xV5mH2PFpEAUuiG6q1_Pz6LdBcaUueBq4r+vT8mmmA@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 12 Dec 2022 10:13:55 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: [LTP] Fix the syntax error ltp
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
From: Zijun Zhao via ltp <ltp@lists.linux.it>
Reply-To: Zijun Zhao <zijunzhao@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi there,
  Could you help me review the patch? Thank you!
Best regards,
Zijun Zhao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
