Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6336324CADB
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 04:30:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D0A73C2FCF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 04:30:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 153E93C13D8
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 04:30:28 +0200 (CEST)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D8F591400076
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 04:30:26 +0200 (CEST)
Received: by mail-yb1-xb36.google.com with SMTP id i10so247317ybt.11
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 19:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=uVtw2DDOV4dbvbX3Uh9zR6eo5NkrFUNLWLTJgRzqRvs=;
 b=d6H2+iCx6DQUsxTGpdrLvK4stcSZWrJ+r4Cl1Zn5bWbF4lxMe5RKecktftesqdmoDw
 KXDcqT51y0MQEn3MoHFhAlJFm0ogmfZfRb8ja8CfIKdRCQdJYMsB2b6sehqy7xpni8ut
 Y8atYhowlnL7wE0aYxE/lqpMc/hsRIq9hnsfUNu0pZliwizAcDf7kXFnt8OThAuPFi15
 GeF6RuZQn+8pJsJ3asLVrIvJ9VVXtMnf1ZHcofs53Ke0ro4BC7ZKCxeCnxEpZQOIPLyB
 eejrG3a9EjClQng54x2s2Gia+7LgMpob9kMXYT6W0cFAnYzGYGIvdWXmPFYvh6gnS4lX
 +wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=uVtw2DDOV4dbvbX3Uh9zR6eo5NkrFUNLWLTJgRzqRvs=;
 b=eGHcbD2WFY9/syPbr+gVIrWQmk7qwRe9u2mn2HPXHlxX0aq7msQR/W29uVRs2ZWC6c
 9Ra5jJUtQ0zFaQ8iz2DFKkQyf4xuQofVWV1Q9BPSAwuarrQr3g2L7utWAM9DTBbRaU9q
 +TExQy1xtdh/j4lMRJ2YVKehMr2Cy9+zh5XoLv+W+yhNO/PMjAKsKpO1d6Ywt0AqD+R2
 wme7JlxMIff1p+mrBL5P5Stwg098HePkM8ir72iTXPEF4kYxCaMp10e8YuetVQ6OYE/k
 ZlDClfSE9sjBr2ESBV3YWiykXXMCPKRCX5L3hdO0Ol6hVXCwzkgBOZ41XDhdBVBHlA1i
 Jygw==
X-Gm-Message-State: AOAM530ti79IFzQSglYQh9zNICoQfF5rTOWwJkdgoI0Q3oikwkCa80E3
 6eEd4ta57PHnzcncEdSFGosroiP38EppCUahQ/Y=
X-Google-Smtp-Source: ABdhPJxNNh/wzX3pLK9MZGkYeH2Bw9Xx1LbN7e1lk/ASuEeK8PqtYkrdU2bum7IiatoFzWG9s4tOvctse0n7S5EPE14=
X-Received: by 2002:a25:23c6:: with SMTP id j189mr916042ybj.362.1597977024750; 
 Thu, 20 Aug 2020 19:30:24 -0700 (PDT)
MIME-Version: 1.0
From: Cixi Geng <gengcixi@gmail.com>
Date: Fri, 21 Aug 2020 10:29:49 +0800
Message-ID: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>,
 ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC] ltp test add reboot function
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
Cc: Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQUxMOgoKSSB3YW50IHRvIGFkZCBhIHJlYm9vdCBmdW5jdGlvbiBpbiBMVFAgZm9yIG15IHRl
YW0gd3JpdGUgYSBtZW1vcnkgcGFnZQpyZWxhdGVkIGNhc2XvvIwKYW5kIG5lZWQgcmVib290IHRv
IG1ha2UgdGhlIG1lbW9yeSBjYWNoZSBvciBzb21lIGxpa2VseSBpdCBwdXJlIGNsZWFyLgoKU28g
SSB3YW50IHRvIGFkZCBhIHRzdF9uZWVkc19yZWJvb3QuIHdoZW4gaXQgd2FzIHNldCwgcmVib290
IHRoZQptYWNoaW5lIGFuZCBjb250aW51ZQpydW4gdGVzdCBmcm9tIHRoZSBwb2ludCBiZWZvcmUu
CgpJIHRoaW5rICB0aGlzIHJlcXVpcmVtZW50IGlzIG1lYW5pbmdmdWzvvIwgU28gY2FuIHlvdSBn
aXZlIG1lIHNvbWUgYWR2aXNlPwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
