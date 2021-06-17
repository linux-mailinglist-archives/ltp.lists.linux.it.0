Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B2F3AAD00
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:07:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE0233C88B1
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:07:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CBA153C2DC7
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:07:36 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 21E351001198
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:07:35 +0200 (CEST)
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1ltm7j-000405-3M
 for ltp@lists.linux.it; Thu, 17 Jun 2021 07:07:35 +0000
Received: by mail-ed1-f70.google.com with SMTP id
 t11-20020a056402524bb029038ffacf1cafso992010edd.5
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 00:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/EIzPNuFyxax8pyEhxjZKuhbP7zUBgkIopRBbbJE5fg=;
 b=fXIeHePTJyyGs1P2tpcbqji+qRDY+fBI+roxiXudiLTV3Tq0ycP3/YfvbZoBlqCqSl
 Y/6d02No4vfIl+/DfmOk255dRCiOXak1ysFlJNMSQCIiwqZs7YJDNzR0XdE7AAXKRFBg
 C6mGLt+DvIXEyapxgZ28Mja4wdth8GorlW/COf0n/cT5/3fKY98SjUkaDlmTxUMygetz
 WW45K2dSy6dqS6X/Uj60vSD4Mw9JgXqXIRWptwf4Xk9+1JJVygofrmZpYd3G9DIjSdG2
 OvYif6HO4qy4sblAgITc6hMAtEa5q+JRpu/+SDXl/VXs00Tb28ESDv5aej+vvQFIbjG/
 1daw==
X-Gm-Message-State: AOAM531mOi5urB7XK/AotEz+zvXPIVcXZAmGyPsnDxR/1lfmWKe3QJ+D
 4jb6emVx+2XopnRyAK9EgKwGlGfmweadf9Quv4dx6AbI4akt4SMLe8L3iIv2rahQDGiobNYBXWc
 g87mlxyCh5ZS7551SIvW+Oves0A6U
X-Received: by 2002:a17:907:2059:: with SMTP id
 pg25mr3536300ejb.130.1623913654292; 
 Thu, 17 Jun 2021 00:07:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr3AoK/4xxA9E6jALl3HqHQnVFpwMn3wPt/khHy4Ox8ox3ENan31D+rhyrBs6zOAxLj5hcdA==
X-Received: by 2002:a17:907:2059:: with SMTP id
 pg25mr3536291ejb.130.1623913654170; 
 Thu, 17 Jun 2021 00:07:34 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id u17sm3531258edx.16.2021.06.17.00.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 00:07:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 17 Jun 2021 09:07:27 +0200
Message-Id: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/3] controllers/memcg: fixes for newer kernels
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

Hi,

This is a resend of previous Github pull:
https://github.com/linux-test-project/ltp/pull/830

The patches fix several test failures we are hitting since months, see:
https://bugs.launchpad.net/bugs/1829979
https://bugs.launchpad.net/bugs/1829984

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  controllers/memcg: accept range of max_usage_in_bytes
  controllers/memcg: accept range of usage_in_bytes
  controllers/memcg: accept non-zero max_usage_in_bytes after reset

 .../controllers/memcg/functional/memcg_lib.sh | 22 ++++++++++++++-----
 .../memcg_max_usage_in_bytes_test.sh          | 12 ++++++++--
 .../memcg/functional/memcg_stat_rss.sh        | 20 ++++++++---------
 .../memcg/functional/memcg_stat_test.sh       |  8 +++----
 .../functional/memcg_usage_in_bytes_test.sh   | 10 +++++++--
 5 files changed, 49 insertions(+), 23 deletions(-)

-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
