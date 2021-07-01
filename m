Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A803B9216
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 15:14:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6E953C9AAB
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 15:14:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 25C193C6AF3
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 15:14:33 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7F6FD200DFF
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 15:14:32 +0200 (CEST)
Received: from mail-ej1-f72.google.com ([209.85.218.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lywWV-0004zo-MC
 for ltp@lists.linux.it; Thu, 01 Jul 2021 13:14:31 +0000
Received: by mail-ej1-f72.google.com with SMTP id
 ho42-20020a1709070eaab02904a77ea3380eso2087121ejc.4
 for <ltp@lists.linux.it>; Thu, 01 Jul 2021 06:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TwBHLVGnWlzYo7VJm0OC3JQo+v9eRJS1C+we71KV2+8=;
 b=oA/oticwbpDnug4KhrIAU1lCDVjUqdhSlEHM9JUUW1XfcsUWIrvkUpIMdF1ibxqkxd
 rZ77vHODczwPxZceXNBSrHt41aH6bq0Zv1b+D3lWzOuwq5nKdBmV1c5mBZoNhqQelkdk
 sn9EW/uWLYIchHJD6CpvlNTvA+f8JSx86etLY25nraLsfwVY86JHGpV6fHHlAaRYyPt9
 veUrFw/6Bh7vaGDgvCbz6DK9+EuW7+bgT7YM9Cj1A9nlQjgTVEWsD3tRz7jK2AlCLSvi
 LXV/eX0QBa3h4Ls7O1YznbWt5gkhVi2gi+5+n3ocpnK3Du1xHQ2efH9CdCqqwbJDNIzu
 WztA==
X-Gm-Message-State: AOAM531RdBwkHU5WwtudaQHzyehLMyeN1ZXcgUX6Cj3hd/UPJ5+6N5dl
 5gco64FyEur5HTgBrWHVPAOYl4VIOYc30ukYmzD9iZd2sx8ANozodeQB5od9zH3++cyHf5ju8mM
 hL3BQoY+q4hraQVQr5zQlqq195Ygd
X-Received: by 2002:a05:6402:138c:: with SMTP id
 b12mr54492698edv.268.1625145271238; 
 Thu, 01 Jul 2021 06:14:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvfMLVPuR3yUQAZX/q2AuB/Eu7sEHeq5B+Y6MJWfzjuBkaCTmjx3kOzaHhonjSZ+HR/f0g3A==
X-Received: by 2002:a05:6402:138c:: with SMTP id
 b12mr54492684edv.268.1625145271042; 
 Thu, 01 Jul 2021 06:14:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id du7sm14032595edb.1.2021.07.01.06.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 06:14:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu,  1 Jul 2021 15:14:26 +0200
Message-Id: <20210701131427.72574-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] proc01: fix selinux attributes without
 libselinux-dev
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

SELinux can be enabled on the system which does not have development
selinux libraries.  Such case was already done for Smack and Apparmor
where we unconditionally accept their attribute failures.  Do the same
for SELinux to fix failures like:

    proc01      1  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/current: errno=EINVAL(22): Invalid argument
    proc01      2  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/prev: errno=EINVAL(22): Invalid argument
    proc01      3  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/exec: errno=EINVAL(22): Invalid argument
    proc01      4  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/fscreate: errno=EINVAL(22): Invalid argument
    proc01      5  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/keycreate: errno=EINVAL(22): Invalid argument
    proc01      6  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/sockcreate: errno=EINVAL(22): Invalid argument
    ...
    proc01      7  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/current: errno=EINVAL(22): Invalid argument
    proc01      8  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/prev: errno=EINVAL(22): Invalid argument
    proc01      9  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/exec: errno=EINVAL(22): Invalid argument
    proc01     10  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/fscreate: errno=EINVAL(22): Invalid argument
    proc01     11  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/keycreate: errno=EINVAL(22): Invalid argument
    proc01     12  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/sockcreate: errno=EINVAL(22): Invalid argument

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 testcases/kernel/fs/proc/proc01.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/fs/proc/proc01.c b/testcases/kernel/fs/proc/proc01.c
index 0fae6754f7f7..6ddb6682f38b 100644
--- a/testcases/kernel/fs/proc/proc01.c
+++ b/testcases/kernel/fs/proc/proc01.c
@@ -97,10 +97,12 @@ static const struct mapping known_issues[] = {
 	{"read", "/proc/self/mem", EIO},
 	{"read", "/proc/self/task/[0-9]*/mem", EIO},
 	{"read", "/proc/self/attr/*", EINVAL},
+	{"read", "/proc/self/attr/selinux/*", EINVAL},
 	{"read", "/proc/self/attr/smack/*", EINVAL},
 	{"read", "/proc/self/attr/apparmor/*", EINVAL},
 	{"read", "/proc/self/task/[0-9]*/attr/*", EINVAL},
 	{"read", "/proc/self/task/[0-9]*/attr/smack/*", EINVAL},
+	{"read", "/proc/self/task/[0-9]*/attr/selinux/*", EINVAL},
 	{"read", "/proc/self/task/[0-9]*/attr/apparmor/*", EINVAL},
 	{"read", "/proc/self/ns/*", EINVAL},
 	{"read", "/proc/self/task/[0-9]*/ns/*", EINVAL},
@@ -133,7 +135,9 @@ static const struct mapping known_issues[] = {
 #ifdef HAVE_LIBSELINUX_DEVEL
 static const char lsm_should_work[][PATH_MAX] = {
 	"/proc/self/attr/*",
+	"/proc/self/attr/selinux/*",
 	"/proc/self/task/[0-9]*/attr/*",
+	"/proc/self/task/[0-9]*/attr/selinux/*",
 	""
 };
 
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
