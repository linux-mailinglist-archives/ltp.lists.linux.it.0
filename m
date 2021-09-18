Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE47541064A
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 14:11:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 495DE3C8811
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 14:11:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6442D3C1D28
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 14:11:38 +0200 (CEST)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E89BD1A003DB
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 14:11:37 +0200 (CEST)
Received: by mail-pf1-x42d.google.com with SMTP id w19so11676522pfn.12
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 05:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+a/mDwQgzY+QFjZv0Dp1/ZZ5EL189wI5Q6n8OuE0F4=;
 b=q5+f9x7tsAiwoEz1kAzIzpCrdgQ5Flg9mEisxBuujkItoLhmOn2HcU4jto0dKbJDxQ
 BRnHloX0rE4NN8gW/vMG9K0LYVBw517JiOLpulSPCmVPZqSHn+kJ3xzJSIjW61vXsxOR
 JkUFUxSWDKIR0sGSA8ZXNEX9dHqhVaAJsIo3AVZZC0XOP7WjQ8tNpiGTnxlyIDRa4rnL
 4tZ6nPZC4jI4A1P0obgOLXxGkgXE9fSOxHb9gTrnJWYt5D2zZmOpIxY4BRWN8U3wU85s
 sd2JR/AwIkB7EYTCf5EDvIEkgXfjIr0M4/hcKGczMgjhUYftb/RBmsoCE3NU0Wq1z83v
 ZMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+a/mDwQgzY+QFjZv0Dp1/ZZ5EL189wI5Q6n8OuE0F4=;
 b=XsZuDFVWbzjynR3SEBW4Eo8CZqbUTOvEqobQI0RTtVj9aY892Wk964n0FYiBA/8rtw
 1HUeqW20FIeQxYOXauVfRfk2q7tBAZhd98/+KOiKGBNzfKk/rvJtgw0Mw3b8zEQ672wt
 KVjjlYxnfA6fqFwuF1dKhiKVwxGaDfxr+0tqq4gyO8EIipNo1aHv2HlTAT67X9nYPcLb
 q6NWu2vN+tBWZLItTnyUFwmGOzytWYIIeiQ2wE21T/W7/Tq9mWI5eRpiwUbTZEZKatgx
 1ihI2SP+X3McRrPF2Ab0afx7Pmmt/Rqrj0r53gDafj9OD9zjur5ywYxpsuW0ayA7fu+v
 eDRA==
X-Gm-Message-State: AOAM532+Awyh34NBj94vFw6HMUvd4dq9K+eFQBWcQkMeejHDSAHbU0Lz
 0Fu7nQfX8S1d1NHrpiy/Ugj/fUA19n3Y4wM3
X-Google-Smtp-Source: ABdhPJzyDUEUEJgNoRY2ZqKb9tGLyM7FJgzgRk1PRMCPfPpvcossSjt1kJTonW/iEyvABJ5TNMDYAw==
X-Received: by 2002:a05:6a00:983:b0:444:ac28:1ee1 with SMTP id
 u3-20020a056a00098300b00444ac281ee1mr8847950pfg.49.1631967096348; 
 Sat, 18 Sep 2021 05:11:36 -0700 (PDT)
Received: from fedora34.. (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id g13sm9255556pfi.176.2021.09.18.05.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 05:11:35 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Sat, 18 Sep 2021 21:11:09 +0900
Message-Id: <20210918121114.10694-1-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/5] Convert syscalls/dup2/dup2{01...05} to new API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: QI Fuli <qi.fuli@fujitsu.com>

Convert syscalls/dup2/dup2{01...05} to new API

QI Fuli (5):
  syscalls/dup2/dup201: Convert to new API
  syscalls/dup2/dup202: Convert to new API and merge dup204 into dup202
  syscalls/dup2/dup203: Convert to new API
  syscalls/dup2/dup205: Convert to new API
  syscalls/dup2: rename dup205 to dup204

 runtest/syscalls                          |   1 -
 testcases/kernel/syscalls/dup2/.gitignore |   1 -
 testcases/kernel/syscalls/dup2/Makefile   |   2 +-
 testcases/kernel/syscalls/dup2/dup201.c   | 174 +++-----------
 testcases/kernel/syscalls/dup2/dup202.c   | 210 ++++++-----------
 testcases/kernel/syscalls/dup2/dup203.c   | 266 +++++++---------------
 testcases/kernel/syscalls/dup2/dup204.c   | 165 +++++---------
 testcases/kernel/syscalls/dup2/dup205.c   | 134 -----------
 8 files changed, 244 insertions(+), 709 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/dup2/dup205.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
