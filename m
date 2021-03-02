Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE4432A11A
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 14:44:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0FDE43C56DE
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 14:44:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E8D403C4EDE
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 14:44:21 +0100 (CET)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 781DF1A05C87
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 14:44:21 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id m1so2798632wml.2
 for <ltp@lists.linux.it>; Tue, 02 Mar 2021 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=qWx8+4Qyn51eUsbXWegwhNTLru/AHEqln4Rej6qu9/8=;
 b=S7LlKSPOFbAeRQ1cpohcAnz4kCstEcXMVUxlyEk1V6fbbcmqBu3Eny9nwIi8XzbVxO
 jJy8jStN6oW85AMOhPfMBr9cRf3NW0xS1FbHJYyaVbcJ6oRM2oUMDGNCIvm/DyPUXStT
 nsQzFuVqx7fCcjRUdmO93MFmaC6n7ZkfuH+Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=qWx8+4Qyn51eUsbXWegwhNTLru/AHEqln4Rej6qu9/8=;
 b=n8fIlD+S8hnuIsmLcbj9G8B6OwUWqYzjgu+Xs4HOF8sxANcHRepttWjZe+5+g6Durf
 xVrN+1X+Yq2Z2CdTgSdIwIMKkeMqr+PomIiEmYsSwRDc8xZw7byV6ccVu8KlAJIRXeYL
 7zQhzo4rsmsyQcCm0RdWXYzKVTi5N9JTMB4oplDob6BPqlKkDbAecFYZASGg9L/PbRW7
 T8IyhsOf2DIJ2e7eA6LCVcU9x7SXm2kdGcxAJOoDpYZIAopNgUE1gAIBlVIprhMSJxSU
 E42EMP/RJJ9dCUJjKyA4lCFuNzrIF852ZZCpIs75e8xc91zNqQOOkvwSyLh+YaVHztei
 eOJA==
X-Gm-Message-State: AOAM533DEchL4TgJanMr+jYlsc1A54gb76C4Z6ceSuFQq0GMoLWE3+w3
 jyckoG/OB00DUU8gwyeAdastCIWUVia/5w==
X-Google-Smtp-Source: ABdhPJx1FwLEZZ3/B7ZUUzX2v3UDeMo8A24Sld1Rpy6lOdq8bgUJx4K6MBFG6NZd9tlkGIKgpswNew==
X-Received: by 2002:a05:600c:1405:: with SMTP id
 g5mr4031378wmi.140.1614692660964; 
 Tue, 02 Mar 2021 05:44:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53?
 ([2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53])
 by smtp.gmail.com with ESMTPSA id e1sm30226011wrd.44.2021.03.02.05.44.20
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:44:20 -0800 (PST)
Message-ID: <1fa1c796f925bae086f1a6d6ab94c21432419628.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: LTP List <ltp@lists.linux.it>
Date: Tue, 02 Mar 2021 13:44:19 +0000
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] mk/lib.mk: Sort wildcard expansion for determinism
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The order of the objects linked into libltp.a varies depending on the
order of the files found on disk. This results in most ltp binaries
differing depending on that order too.

Sort the wildcard expansion of *.c which leads to reproducible binaries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Index: git/include/mk/lib.mk
===================================================================
--- git.orig/include/mk/lib.mk
+++ git/include/mk/lib.mk
@@ -50,6 +50,7 @@ endif
 MAKE_TARGETS	+= $(LIB)
 
 LIBSRCS		?= $(wildcard $(abs_srcdir)/*.c)
+LIBSRCS		:= $(sort $(LIBSRCS))
 LIBSRCS		:= $(abspath $(LIBSRCS))
 LIBSRCS		:= $(subst $(abs_srcdir)/,,$(wildcard $(LIBSRCS)))
 LIBSRCS		:= $(filter-out $(FILTER_OUT_LIBSRCS),$(LIBSRCS))



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
