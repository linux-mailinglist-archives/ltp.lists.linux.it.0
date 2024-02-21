Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A84BA85D2BE
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Feb 2024 09:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1708504989; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=bEJUgdQOF5B36JYuzBuDNuMTcGdgcRbevj1ZRm2tbGs=;
 b=BGkqNJzzzx3/GCSDYFSH3l9TsJ8QGLl4fNxK7BmyL4yY8jnaSTjRXR7z8iPfZl7/3DTuW
 TDd1Flu9HJtQOyabtzXa/z27YOtLvx3uGtnhnoi8cXp/tj5ny7z/QWW6W/aa5bVlu4/7aON
 BD+ml1S+sNlzzjGBs52q5sYvolApspU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52DE63D0155
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Feb 2024 09:43:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DB2C93CAB6B
 for <ltp@lists.linux.it>; Wed, 21 Feb 2024 09:43:06 +0100 (CET)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BC1D91A01234
 for <ltp@lists.linux.it>; Wed, 21 Feb 2024 09:43:05 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d22fa5c822so47238591fa.2
 for <ltp@lists.linux.it>; Wed, 21 Feb 2024 00:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1708504984; x=1709109784; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tS2w1IlT5+E5TJHQIGZ+cL5kCRf4LKp2MkCjWqkj3fI=;
 b=FgCdkma/RUqtdkkuJWTxUslAOSgQYnh5z7jc1YzJ/2Ko+zwHa0bi0SOM/iHEKIZtih
 61bQN5Z2s0szDghN48OgNce8qP6cvWSfJqJHSt1a/4/v6hxUXv2P/PgMGVtHpdQRQtyl
 fkL/rwwZHpWmKra+zRC/hOVb7muZmQmLcrsmx5DiCBelol0ORHz8WSbKmVNpi80FTO0T
 K6VFcEMyhINHE0EI8ETvJV5KgIsBqwRJof6UqguxgtqcBDxzIfsbme5LdLtKaKXxDbWV
 WR5tiNy0+6qBR6+8Nz1r2Lh2LzeqsT9G0d67RKv/g6td9Cia0p/iWGXagP0dn5Qak59I
 amoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708504984; x=1709109784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tS2w1IlT5+E5TJHQIGZ+cL5kCRf4LKp2MkCjWqkj3fI=;
 b=PSC4n2armFmndqLDOeCwFOH0s53uRxVEgOPyvAH6poAc3G/tG4JhidzuHBv04QrBUO
 AkbJleXSecjGGYFR4Im8uNUIOoni+3dqRkCkFH+RIxqCunpnFpe0DgoJwxnqGwFwmwz3
 cGfE7FUcUAjUAXL8tCGhbFat3MJJSH67IgYcfWGAztqaqi99q0toApHq2Odw3gJs8+++
 neuzrGVMK//QDfBfo32FmCwXbOPTYDNteeqWnARavszE3mGu13OiWqbHTUs/ZP9lbQKu
 Mfzi8m7Fv/+XhhAiE1IDWxUUB1xRmlU7fnUp309NFvx0uplVjZZ+Xt/maOwqTV+iKA2J
 7ulQ==
X-Gm-Message-State: AOJu0Yyr2yS2xw0BqqYyXdrPlQ+RiCqsKlEPYxeCkw0k0qGZJx2ei5el
 MJCl7dfUo1FpUkN7A/jXhD4wNfmmp++3obArkfpPjbTgYqNi5EOdImVIh62MxIlgmuiuo2x1N7Q
 =
X-Google-Smtp-Source: AGHT+IF82e6P1krXwvmIWFJYUfEgHQo7f9MH7EiV5PsI/bqWeWB9cHbmg6x4GaJUC3dwuHZZRSDFhw==
X-Received: by 2002:a2e:3006:0:b0:2d2:3a0b:cafd with SMTP id
 w6-20020a2e3006000000b002d23a0bcafdmr7341669ljw.39.1708504984441; 
 Wed, 21 Feb 2024 00:43:04 -0800 (PST)
Received: from localhost ([223.72.38.233]) by smtp.gmail.com with ESMTPSA id
 sb14-20020a17090b50ce00b00298d8804ba8sm1116234pjb.46.2024.02.21.00.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 00:43:04 -0800 (PST)
To: ltp@lists.linux.it
Date: Wed, 21 Feb 2024 03:42:54 -0500
Message-Id: <20240221084256.32661-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240221071635.17239-1-wegao@suse.com>
References: <20240221071635.17239-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 0/2] Set system default umaks to 0
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Wei Gao (2):
  cgroup_core01.c: Set system default umaks to 0
  statx07.c: set umask to 0

 testcases/kernel/controllers/cgroup/cgroup_core01.c | 2 ++
 testcases/kernel/syscalls/statx/statx07.c           | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
