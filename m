Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45640174083
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 20:47:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D56693C6AC5
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 20:47:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 755743C2353
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 20:47:20 +0100 (CET)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8F7AD600F0F
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 20:47:19 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id u3so1630708plr.9
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 11:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=X4UpkvxRSsDaacpcubk0nkiriwXKwn9D94vUrKr/vyo=;
 b=G563qCNJh9ak+DUDe4FnDUAWSf1Wru5HotEqKRP4uLuIfM+UR5qdsEzE80G7pKEmQN
 fMQXN9VxAUr+Mf1Mgieoz5mBDFDTd5w2+iD+fBhwR8TeY0swTOLeYmFfMHcXqQHORMhD
 7IfbQFUY4ZzHcplQZeHVGLisQLPQtTDkdpKzPk92DyQ2rziRkOO5t9e+J8DmskIq5zjJ
 R6NAUmWZVZj7m3LT6rDzLsdfMrtN5bA7vlK/iopPf11+SeZWGg52QJcfTCeeb5fifcnC
 UY94qsMdubzBBNUAvYPJahsXRR366QcuvF8pDWbgZQ6abDbUqsWlru3EtPLNsfQ75FU7
 w09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=X4UpkvxRSsDaacpcubk0nkiriwXKwn9D94vUrKr/vyo=;
 b=T+NbHISiE4VuW1xrZwYReDaPdg1BY8kQmVgXUn8pzMNWiTbxgoSVRALlskYGO76saa
 sH93ilBOlE6QBO5BKWjUleWd/Jb+Jp9nm6kGs/BFDB1ZNCOGCImfSUcDEzVcZ2+DAAwa
 +NfZcjuhfFInGbILFDYsGoVkfPZ4wh4lprA/kXeeO2VUGoZ0FnJFvcYH1yPI6pyl+SAH
 S0sLuDm1XC+I/sGouJ5T6LlBRL+dk5XQGcAlz2dATbkqq7FcBwRbHuxQ2uGrg0UwZ/JE
 JIBnEHEEfQfRP1sBSZWEsT2BT8VEde+A4vyfXsjxuS6od/OGT2Ki1RIBmRaT5b+HZ9T2
 Ad3g==
X-Gm-Message-State: APjAAAXuwGcbFll1UEDUU5xglBOkwlZo1ZtQk0CqILkyTcAB/JJP5dim
 0BpcPJasmDix2quwyqdYfzKvjw==
X-Google-Smtp-Source: APXvYqzYmzi9fFE9X85bIPcyOMhmZAZkvtXx9LRfjT+ENAsukziXcM6J1FgvBKPn9sqlAOLIw9einA==
X-Received: by 2002:a17:902:8b81:: with SMTP id
 ay1mr5095048plb.275.1582919237790; 
 Fri, 28 Feb 2020 11:47:17 -0800 (PST)
Received: from smuckle.san.corp.google.com
 ([2620:15c:2d:3:8fbe:ee3b:c81d:238d])
 by smtp.gmail.com with ESMTPSA id q4sm12799872pfl.175.2020.02.28.11.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 11:47:17 -0800 (PST)
To: liwang@redhat.com
Message-ID: <2365a007-02fe-c48c-2df5-04aedc076208@google.com>
Date: Fri, 28 Feb 2020 11:47:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] use of pthread_cancel in tst_fuzzy_sync.h
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
From: Steve Muckle via ltp <ltp@lists.linux.it>
Reply-To: Steve Muckle <smuckle@google.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

While integrating the latest LTP release into Android's VTS test suite I 
ran into trouble with this commit:

commit cad524797ba4cee2e40985043f113256419f4a90
Author: Li Wang <liwang@redhat.com>
Date:   Thu Sep 26 17:39:21 2019 +0800

     fzsync: revoke thread_b if parent hits accidental break

It introduces a dependency on pthread_cancel() which Android does not 
implement:

https://android.googlesource.com/platform/bionic/+/refs/heads/master/docs/status.md

In the short term I can work around this, taking out the 
pthread_cancel() should be fine as far as I can tell as it is just used 
to avoid a timeout in certain circumstances. Long term though, could 
this be reworked to use pthread_kill() or some other mechanism?

thanks,
Steve

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
