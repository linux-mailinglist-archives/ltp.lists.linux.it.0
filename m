Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4111919E
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 21:13:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25EB93C220F
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 21:13:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 70C9E3C1C8A
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 21:13:30 +0100 (CET)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D88F7602436
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 21:13:29 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id p17so4632903wma.1
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 12:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FM0FYfuAfv7+y7epM8Z+YuvemGeI0QGY7CYlUdBOZaQ=;
 b=twOJEM++yga6hzg7EELt2umTQedHo+zjFnzHGdmAJEy1Q6N1iAWQVClWHb7o4+F6GZ
 HeS1Fg9tq9x7v44jFaoSBH2uVtGIkla2Fi3gVdGdhCsHz1Ul6bBzuAIwEWqxglkgXs9p
 HNrsESYqJTLEEqdAH3KOWpyy1rvCWHp4sMuZEH9f+TdAzfL3wozKH+TFDUpOUejcH94r
 pN/8ptkOudMtkt6mofdPPRv0Sli3/EtTjpuOalABpzMqArqit3hG6tJmeJnyXby4SFJW
 vwHFJdljRuoV2a/4zl2bO5KwCeoWZd3ktbWgCX8GGv0yloDy7uUKTbJXhPNME34nwMN4
 /thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FM0FYfuAfv7+y7epM8Z+YuvemGeI0QGY7CYlUdBOZaQ=;
 b=KBdln3lcsTHXDevIpM40Qw1a0x8jTblHJKFiHGs6Xl8aKFovyrVXJpNLz93HZp4Hw5
 QT/LxlCfIelobsiOn2uf57s4+730fqPWjrz12/S44fm+2ENEW4CAdwgV2mw7wTP5b0Lh
 aZ2ESOhDh/RccLgwixfYm7/Nj6w+x1XUARYFlQGSwqsQiZO8vXwYHWfF0/HRT8O52ggx
 VvoAqGPp681CUfaZPzFG1H+yebLTZvKcHqDuhJz4faw7gSQzoUq6Hm2p6sftbVwpM4A4
 07VL83jdmuu8H1QH/xrmZbxv8dwUStfdHpA9Zc3GGmD57fRBE+x8ofkSRvRuCU9NjPys
 NvFQ==
X-Gm-Message-State: APjAAAUV0Yv18Hv5D1N2DCR5p9iiX5eBhx5MgGRJ+4AJBWshpq4Qcz5o
 weXXIaPUJN7I5fagaBjAS444REYX
X-Google-Smtp-Source: APXvYqyHt148pjUBgCIojkGmeAVjy6by9fb/i+OR9NoPrzG/krtnRi3j/9k3ySfRJjaFprXTcFfKBA==
X-Received: by 2002:a1c:731a:: with SMTP id d26mr6812080wmb.130.1576008808889; 
 Tue, 10 Dec 2019 12:13:28 -0800 (PST)
Received: from x230.suse.de ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id z18sm4208205wmf.21.2019.12.10.12.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 12:13:28 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 10 Dec 2019 21:13:18 +0100
Message-Id: <20191210201321.1430984-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] musl: travis build and include fixes
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

although LTP not yet fully support musl, I'd like
to add travis build via Alpine linux distro.
Remaining broken tests are deleted before building,
I volunteer to solve musl problems for new code.

I also added 2 simple RPC fixes.
RPC tests deserve some rewrite, but I'd postpone it.
https://github.com/linux-test-project/ltp/issues/621

Kind regards,
Petr

Petr Vorel (3):
  travis: Add musl build (with Alpine Linux)
  rpc: Add missing <string.h>
  rpc: Remove <sys/socketvar.h>

 .travis.yml                                   |  7 +++
 .../rpc/basic_tests/rpc01/rpc_server.c        |  1 +
 .../rpc_clnt_broadcast_dataint.c              |  1 +
 .../rpc_svcraw_create.c                       |  1 -
 .../rpc_svctcp_create.c                       |  1 -
 .../rpc_svctcp_create_stress.c                |  1 -
 .../rpc_svcudp_bufcreate.c                    |  1 -
 .../rpc_svcudp_create.c                       |  1 -
 .../rpc_svcudp_create_stress.c                |  1 -
 .../rpc_registerrpc.c                         |  1 -
 .../rpc_svc_register.c                        |  1 -
 .../rpc_svc_unregister.c                      |  1 -
 .../rpc_xprt_register.c                       |  1 -
 .../rpc_xprt_unregister.c                     |  1 -
 .../rpc_stdcall_callrpc/rpc_callrpc_dataint.c |  1 +
 .../rpc_clnt_call_dataint.c                   |  1 +
 .../rpc_svc_freeargs_svc.c                    |  1 +
 .../rpc_stdcall_svc_getargs/rpc_svc_getargs.c |  1 +
 .../rpc_svc_sendreply.c                       |  1 +
 .../tirpc_bottomlevel_clnt_call_dataint.c     |  1 +
 .../tirpc_bottomlevel_clnt_call_mt.c          |  1 +
 .../tirpc_bottomlevel_clnt_call_scalability.c |  1 +
 .../tirpc_expertlevel_clnt_call_complex.c     |  1 +
 .../tirpc_expertlevel_clnt_call_dataint.c     |  1 +
 .../tirpc_expertlevel_clnt_call_mt.c          |  1 +
 .../tirpc_expertlevel_clnt_call_scalability.c |  1 +
 .../tirpc_rpcb_rmtcall_complex.c              |  1 +
 .../tirpc_rpcb_rmtcall_dataint.c              |  1 +
 .../tirpc_rpcb_rmtcall_mt.c                   |  1 +
 .../tirpc_rpcb_rmtcall_scalability.c          |  1 +
 .../tirpc_svc_reg_mt.c                        |  1 +
 .../tirpc_svc_unreg_mt.c                      |  1 +
 .../tirpc_interlevel_clnt_call_complex.c      |  1 +
 .../tirpc_interlevel_clnt_call_dataint.c      |  1 +
 .../tirpc_interlevel_clnt_call_mt.c           |  1 +
 .../tirpc_interlevel_clnt_call_scalability.c  |  1 +
 .../tirpc_rpc_broadcast_dataint.c             |  1 +
 .../tirpc_rpc_broadcast_mt.c                  |  1 +
 .../tirpc_rpc_broadcast_scalability.c         |  1 +
 .../tirpc_rpc_broadcast_exp_dataint.c         |  1 +
 .../tirpc_rpc_broadcast_exp_mt.c              |  1 +
 .../tirpc_rpc_broadcast_exp_scalability.c     |  1 +
 .../tirpc_rpc_call_complex.c                  |  1 +
 .../tirpc_rpc_call_dataint.c                  |  1 +
 .../tirpc_simple_rpc_call/tirpc_rpc_call_mt.c |  1 +
 .../tirpc_rpc_call_scalability.c              |  1 +
 .../tirpc_simple_rpc_reg/tirpc_rpc_reg_mt.c   |  1 +
 .../tirpc_toplevel_clnt_call_complex.c        |  1 +
 .../tirpc_toplevel_clnt_call_dataint.c        |  1 +
 .../tirpc_toplevel_clnt_call_mt.c             |  1 +
 .../tirpc_toplevel_clnt_call_scalability.c    |  1 +
 .../tests_pack/rpc_svc_1/rpc_svc_1.c          |  1 +
 travis/alpine.sh                              | 51 +++++++++++++++++++
 53 files changed, 98 insertions(+), 11 deletions(-)
 create mode 100755 travis/alpine.sh

-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
