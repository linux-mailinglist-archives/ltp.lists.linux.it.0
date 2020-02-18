Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868F1622D5
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:54:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7E2B3C254C
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:54:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 497B13C17C4
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:54:41 +0100 (CET)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9CB2D601142
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:54:40 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id n25so13936567lfl.0
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 00:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=XG/ToDNpjK7E8+3CGMxRl+g9s3/nMUlrXkuxpJ67stc=;
 b=c7sRKvLQ8+H4frQrJ1H8goYPxVlU2AddyNxLpIBIN/AqaMvzf4x6wmtCJANmwtDMEF
 7hNgxiz7QJOEHdbPyK8R79tWdL5zujKNA9+xcLswzikMaIbSejle8WOzaji5a8dMulDY
 YvdfCgafpkZjEoo0eRQq58dt3NKEOYCBBqhOypNgW2fegl41SFwtUWQNqf/+771fPIKC
 m7YPXZ55o8kRKs+VXdA8/FG/Y7WPxUu1t/tgzDqeX4b2thHL0S4NnSLdkmVUTudUTRsN
 svCjWi9i/ey3cLgtKs7vslFENfMsTmxmu3F7PpvuT1E1rkQt4RpOmqwiPF+duYUT5gOv
 WhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=XG/ToDNpjK7E8+3CGMxRl+g9s3/nMUlrXkuxpJ67stc=;
 b=bvDsf9tLVR2SfWTlyvz4v7/VX+/oNO7JfZW1Hk3iLaN5GoXvGWk0lYrMlSL2OKRJL2
 OjrGjlpHhbu6sgSW/PS5HCQweGld5rUhHKAbxKfNF5UdO5/0GXRZ+PlY4OrOSwsN3vSz
 Ht8Q0s39ogjsQwS1CMR4BTvvFer83+y+OMqu27hBlK9PcAX2V2NnEdCOuFIYJW9sHqkP
 02YPEnZp4reeovPXhsbEJ5uyNlid+STyI4a003Lpd6yC02h8s/Xc1HAR9rtUTeg9rB5a
 eUBoT4IvnpJSWK+EIb9EIEOq3lqu2TAtsEuZ5u5PPC0AgGc21XM2pESd1QfX+POKWJO5
 0Yjg==
X-Gm-Message-State: APjAAAXnKExqHbnVf8ovstCZbbzEFGn6cU55/vY6Y96wQ25e8Z4gxT1v
 Y1w8e3EQ1L8+LmjdHGZl1joiGhblos1dPLgOwCWFcg==
X-Google-Smtp-Source: APXvYqyCg/ZmVyNTESFogv89ipoB2XbTpF1LFPmdEqcmNwY2/no19dGcxt27cJaHQ5PEo6SoifP4ZcnehB2lQRVEYh0=
X-Received: by 2002:ac2:5467:: with SMTP id e7mr9516197lfn.74.1582016079887;
 Tue, 18 Feb 2020 00:54:39 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 18 Feb 2020 14:24:27 +0530
Message-ID: <CA+G9fYtmJkYdUG1wXgUHs3KoLdGQPYFcR8oTzFmDJ5oMXu5kaQ@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] stable-rc 5.5.5-rc1: [drm:ade_irq_handler [kirin_drm]]
 *ERROR* LDI underflow!
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
Cc: xuyiping@hisilicon.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org,
 noralf@tronnes.org, John Stultz <john.stultz@linaro.org>,
 linux- stable <stable@vger.kernel.org>, daniel@ffwll.ch, sam@ravnborg.org,
 LTP List <ltp@lists.linux.it>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The arm64 device running LTP hugetlb test suite caused test hang on
stable-rc 5.5.5-rc1 due to [drm:ade_irq_handler [kirin_drm]] *ERROR*
LDI underflow!.
Same problem noticed while running libhugetlbfs test suite.

Problematic patch not identified yet.

hugemmap05.c:223: INFO: original nr_hugepages is 0
hugemmap05.c:236: INFO: original nr_overcommit_hugepages is 0
hugemmap05.c:104: INFO: check /proc/meminfo before allocation.
hugemmap05.c:285: INFO: HugePages_Total is 192.
hugemmap05.c:285: INFO: HugePages_Free is 192.
hugemmap05.c:285: INFO: HugePages_Surp is 64.
hugemmap05.c:285: INFO: HugePages_[   51.411646] [drm:ade_irq_handler
[kirin_drm]] *ERROR* LDI underflow!
Rsvd is 192.
[   51.411735] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.419705] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.427680] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.434455] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.441179] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.447912] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.454639] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.461395] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.468175] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.475014] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.481868] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.488621] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.495367] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.502113] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.508845] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.515582] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.522316] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.529054] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.535836] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.542621] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.549399] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.556144] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.562897] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.569634] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.576378] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.583142] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.589889] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.596610] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
hugemmap05.c:260:[   51.603356] [drm:ade_irq_handler [kirin_drm]]
*ERROR* LDI underflow!
 INFO: First hex is 7070707
[   51.610101] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   51.621956] [drm:ade_ldi_set_mode [kirin_drm]] *ERROR* failed to
set pixel clk 0Hz (-22)
hugemmap05.c:139: INFO: check /proc/meminfo.
hugemmap05.c:285: INFO: HugePages_Total is 192.
hugemmap05.c:285: INFO: HugePages_Free is 0.
hugemmap05.c:285: INFO: HugePages_Surp is 64.
hugemmap05.c:285: INFO: HugePages_Rsvd is 0.
hugemmap05.c:163: PASS: hugepages overcommit test pass
hugemmap05.c:180: INFO: restore nr_hugepages to 0.
hugemmap05.c:189: INFO: restore nr_overcommit_hugepages to 0.
Summary:
passed   1
failed   0
skipped  0
warnings 0
tst_test.c:1217: INFO: Timeout per run is 0h 15m 00s
mem.c:817: INFO: set nr_hugepages to 255
[   54.139687] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   54.143384] [drm:ade_ldi_set_mode [kirin_drm]] *ERROR* failed to
set pixel clk 0Hz (-22)
[   54.278589] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   54.280642] [drm:ade_ldi_set_mode [kirin_drm]] *ERROR* failed to
set pixel clk 0Hz (-22)
hugemmap06.c:139: PASS: No regression found.
[   54.520165] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   54.522769] [drm:ade_ldi_set_mode [kirin_drm]] *ERROR* failed to
set pixel clk 0Hz (-22)
[   54.664774] [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
[   54.668013] [drm:ade_ldi_set_mode [kirin_drm]] *ERROR* failed to
set pixel clk 0Hz (-22)

<SYSTEM HANGS HERE>

Ref:
https://lkft.validation.linaro.org/scheduler/job/1227316#L4288

metadata:
  git branch: linux-5.5.y
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
  git commit: 7d6c8f2632c92635fcef4175921a7742f23947e4
  git describe: v5.5.4-46-g7d6c8f2632c9
  make_kernelversion: 5.5.5-rc1
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/hikey/lkft/linux-stable-rc-5.5/24/config
  build-location:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/hikey/lkft/linux-stable-rc-5.5/24

-- 
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
