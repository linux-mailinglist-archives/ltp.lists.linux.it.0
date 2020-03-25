Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED1019273B
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 12:35:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 371973C4BAF
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 12:35:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7F1563C4BD9
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 12:35:22 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 41BB81001420
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 12:35:22 +0100 (CET)
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1jH4Jd-00008Q-LZ
 for ltp@lists.linux.it; Wed, 25 Mar 2020 11:35:21 +0000
Received: by mail-pf1-f197.google.com with SMTP id a188so1873201pfa.12
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 04:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=md3UWaiMcXcETbhhQfvbciALyAQxNxOwJqVfeUnCjDw=;
 b=UE55cadm2O1wG7soR0kSBQ4w3/mraGuWujBHFagHwFcvG6P/aEFCP0TbRT9a+aBJmo
 VjmPeqU6P3TB7q3iB1M3bayPUxsmqlUTa984YV5k9/bUXrnIrnq+5GACfCEsLW1pm25D
 BQXDFxVCwX7QnUPcxrAfDgtABUZxHzDjubZoTfX8Kumxuh4hi5BqWDebjLJnj/YRXtvi
 SOWBsu2vTZrwtbVHWImFuEQxgnD2yW1Bv2D0XrwbDE6or4+glsSgqOsDAAz6iqK698KG
 hJ+jpUECiWE5hZY2gmPkKngGdmk9hVpwUwXGNPMNSaitkWmcdgyKEAVjiCH5LyyiqlBk
 79pg==
X-Gm-Message-State: ANhLgQ12G995dNs5o9DNeBdwHi4PPJX48Seq0fmkT62HRMqGuj3XfZd1
 uwouICwAMvll6YFZjGfSEZ9uKz6dB3lswjPADC9TYSI+N4qdc5zEoYJ5A7towa3xK8lS1p2c85l
 67dFoHGRBWB1ObmBBL70ASMskzMQ=
X-Received: by 2002:a62:a119:: with SMTP id b25mr2978030pff.158.1585136120362; 
 Wed, 25 Mar 2020 04:35:20 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtcqBfeJXjqrix6xmjzfAueVXq2Dc6PKSRQl+PC8B2Yrj40pcRI11ZnlVcSGGU8ffl/AQs24w==
X-Received: by 2002:a62:a119:: with SMTP id b25mr2978003pff.158.1585136119999; 
 Wed, 25 Mar 2020 04:35:19 -0700 (PDT)
Received: from localhost.localdomain (223-136-97-141.emome-ip.hinet.net.
 [223.136.97.141])
 by smtp.gmail.com with ESMTPSA id x4sm1814400pgr.9.2020.03.25.04.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 04:35:19 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: xuyang2018.jy@cn.fujitsu.com,
	ltp@lists.linux.it
Date: Wed, 25 Mar 2020 19:35:07 +0800
Message-Id: <20200325113507.22086-2-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325113507.22086-1-po-hsu.lin@canonical.com>
References: <20200325113507.22086-1-po-hsu.lin@canonical.com>
In-Reply-To: 1584507302-23515-1-git-send-email-xuyang2018.jy@cn.fujitsu.com
References: 1584507302-23515-1-git-send-email-xuyang2018.jy@cn.fujitsu.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] ltp_tpci.c: fix a null pointer
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

We have encountered this null pointer dereference issue too, with this
fix the test can be executed properly.

Tested-by: Po-Hsu Lin <po-hsu.lin@canonical.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
