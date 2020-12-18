Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 003842DDED0
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 08:06:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBCC73C2A9B
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 08:06:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 383E43C2A14
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 08:06:35 +0100 (CET)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C857A201082
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 08:06:34 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id b9so1741137ejy.0
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 23:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVmIY40mGVAkeZqYUBhZLd9jalF0pfJif34rTHVwHdw=;
 b=Fy/AYtfjwnGRtP6tgTITYhK274OGbRvSzBBPOryNwcSfhMf2J+2hnTHqC7KoUhEkjV
 uqsp5Pa1HXswTUfBFhQSVkYa9HrvyieQX0XErxdy6NDWD45PadyzhIKMYRvzyad1PHoy
 54vPw4nLAZe3QL+LyRunAWvoK2CWAYDYeUlPm4Q19Umsk65gCcueZeVb1hozV+a7IjP1
 77iK/BAQV89M9qONGZNljk3d8Vzw9ZXcegWTrCu9Le9j3DhpxzrcWY2T7h/sQhl7GAJo
 96evXO64zK2LcezvVU2mLxYYA2eIWFrAqgmLlz4y+IBVTtEqy56vlbW4W5rJVJTxPjvn
 jyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVmIY40mGVAkeZqYUBhZLd9jalF0pfJif34rTHVwHdw=;
 b=PILURzLbcQ83xinCZeAsMotOU/5LV/NDEdeoTDCdxlvw5wQTJLSvw449lL+sUGCVDz
 hjBHIng8nCW49bqSoWeUTP5+Pz8ZLxqZSmQfOTsVkSZ5AoWAO8apefH4vC7DG99Kzzuc
 BkPFZ+rakUTYiRXQvRDyx4Rp+SxeW0sUE/Ev/X98YYLAhX2mmloK+ncd83F8/IKOQUwB
 +6s94+CsTUIuvCZcCtmVhpfLpPm8byQEw6ilk+eYNp+TmyOxWY2wOw2IkYkVW7UuXi+j
 1IR70Tk+lod+NjHYLoQqAhD8HpTsaoY+4eKXRotQur9/b4QCJr1n3UvQYzKraFJMqgfa
 xUXg==
X-Gm-Message-State: AOAM531D95fiXg+TfseGiaakkHpi04XNJ8oQRUsuSVuKrbOyb2wVFdmo
 1MXtUI8w5tACfwChb0DbJWA=
X-Google-Smtp-Source: ABdhPJzCqS1sQ7n7APHeK1ZpCKOpfXOeMij4eDvJ9SehfO+dL8ieUAQjLLxST3+cqfI9I1Apxyt9cA==
X-Received: by 2002:a17:906:9388:: with SMTP id
 l8mr2622765ejx.22.1608275194430; 
 Thu, 17 Dec 2020 23:06:34 -0800 (PST)
Received: from localhost.localdomain ([31.210.181.203])
 by smtp.gmail.com with ESMTPSA id d13sm10852263edx.27.2020.12.17.23.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 23:06:33 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri, 18 Dec 2020 09:06:28 +0200
Message-Id: <20201218070631.1182292-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] inotify tests for v5.9 regression
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
Cc: Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Here is the test for the other v5.9 regression that I mentioned earlier.
The fix commit has just been merged to master.

History:
Originally, inotify10 was written to cover a bug that was detected during
the review of the fsnotify changes for v5.9, but was not merged to v5.9.
Later, I wrote test case #3 to cover another bug that was merged to v5.9.
While testing the v5.9-bug-fix in linux-next, Hugh Dickins reported [1]
a bug introduced by the v5.9-bug-fix, so I added two more test cases
to cover the bug-in-the-bug-fix.
The bug-in-the-bug-fix was fixed before the v5.9-bug-fix was merged.

Long story short, the only test case expected to fail is test case #3 on
kernel >= v5.9 and now fixed in master :-)

Thanks,
Amir.

[1] https://lore.kernel.org/linux-fsdevel/alpine.LSU.2.11.2012101507080.1100@eggly.anvils/

Amir Goldstein (3):
  syscalls/inotify10: Generalize for more test cases
  syscalls/inotify10: Add test cases with two groups
  syscalls/inotify10: Test two inotify groups with parent and child
    watches

 testcases/kernel/syscalls/inotify/inotify10.c | 126 ++++++++++++++----
 1 file changed, 98 insertions(+), 28 deletions(-)

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
