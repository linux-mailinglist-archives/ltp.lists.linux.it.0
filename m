Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA476233BA
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Nov 2022 20:43:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3CEE3CD753
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Nov 2022 20:43:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C297E3CD771
 for <ltp@lists.linux.it>; Wed,  9 Nov 2022 20:43:39 +0100 (CET)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CADD21400540
 for <ltp@lists.linux.it>; Wed,  9 Nov 2022 20:43:38 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id ft34so13356295ejc.12
 for <ltp@lists.linux.it>; Wed, 09 Nov 2022 11:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Ntoy8AyCe/TRcbrwP5YL5bqphFHpz2TiQ7HZNNkJC0=;
 b=WCnuQzP3GDJzdXzBE1P+su6RWr0MjN13ZwYpAUsxaUug38FIn2Vo2+UNHLo+Gs+xmr
 /v4pCqdw0CvGoanDPw9k0KdJqNCVPO7mbBQp1kdwj9ZfV8T4MTwU+98/poQ2DPXawDWk
 Es0q+C257+vbnUnz+pIsPlxQsxm7nk4VkyK/sc7DvRCIKCHZvoARlU/aJ7+WiVqM+glr
 yT5/YIgV/0jRvOIfvZasWsp4QwkAfnec1UWa0do5Cb9zG9ufZD/2F+3gg+IU4UyDXKIy
 D70BaYAczhhw0KjK6kbrmVxVVGXLhTfBTeITBR/2ozF+g0N4lSjx9fcPX24R+UjECniU
 SvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Ntoy8AyCe/TRcbrwP5YL5bqphFHpz2TiQ7HZNNkJC0=;
 b=67A34xHo4oy/DnqHvp2Qg23zsTCakrkC3XoRrLplHooYUapNelKMM+Sqr1YaTcUbZf
 VcFRa/mBByudOB0hUl1yZLeJeHgjkm9F/v5Jf/d0xnFULd5bIr8HwIIz/qD2WeQzoV4L
 AilW8duVh3YwfSO3ak7F6hDmTUAFhm2NB5lHfEe23gLlieM/j4DILYoxbSROgeHK4CLM
 pPeEsnRgDSC53zSiMu5AOvHM3p9A42VX/Lk1/Y/mhdrUjT/zIazck4LO/zU/Vrb0LwRA
 zUoYZbkt4HfzXdUhRAUgtsiT1pwrnmpTs6h4bS2jySbu9XoY2SrhtwGlsT9+U2zOcqZm
 5Vfg==
X-Gm-Message-State: ACrzQf3SIYXlTs41lN+lu1qHMZ61foAx9ogmrfQoUfnBjPfDQGat5SsO
 u7QEL4f/25e+y+Qofex4W3EIm3I4Q4z4cw==
X-Google-Smtp-Source: AMsMyM7Oe4Y/jm2gR67+o1o6pOs9QNXLeEzuxWwNCaO9HurJDZCiiwHLkx99+ujtW4+Bmy2BgI9lGw==
X-Received: by 2002:a17:906:3054:b0:78d:585e:d183 with SMTP id
 d20-20020a170906305400b0078d585ed183mr1624512ejd.768.1668023018153; 
 Wed, 09 Nov 2022 11:43:38 -0800 (PST)
Received: from lab.hqhome163.com ([194.183.10.152])
 by smtp.googlemail.com with ESMTPSA id
 z23-20020a170906075700b00780b1979adesm6170126ejb.218.2022.11.09.11.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 11:43:37 -0800 (PST)
From: Alessandro Carminati <alessandro.carminati@gmail.com>
To: ltp@lists.linux.it
Date: Wed,  9 Nov 2022 19:38:19 +0000
Message-Id: <20221109193819.875478-3-alessandro.carminati@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109193819.875478-1-alessandro.carminati@gmail.com>
References: <877d05wxwe.fsf@suse.de>
 <20221109193819.875478-1-alessandro.carminati@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v6 2/2] c-test-api: Documentation updated
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
Cc: Alessandro Carminati <alessandro.carminati@gmail.com>, rpalethorpe@suse.com,
 acarmina@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Since the tst_find_backing_dev logic is changed, the doc is updated
accordingly.

Signed-off-by: Alessandro Carminati <alessandro.carminati@gmail.com>
---
 doc/c-test-api.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index 64ee3397f..a7888c242 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -1071,8 +1071,11 @@ voud tst_find_backing_dev(const char *path, char *dev);
 -------------------------------------------------------------------------------
 
 This function finds the block dev that this path belongs to, it uses stat function
-to get the major/minor number of the path. Then scan them in '/proc/self/mountinfo'
-and list 2th column value after ' - ' string as its block dev if match succeeds.
+to get the major/minor number of the path. 
+This function finds the block dev that this path belongs to, it uses the unevent 
+file in sysfs to find the device name. It needs to discriminate between btrfs
+and not btrfs. For non btrfs filesystems it uses the minor, major numbers. For
+btrfs it uses the fs uuid.
 
 [source,c]
 -------------------------------------------------------------------------------
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
