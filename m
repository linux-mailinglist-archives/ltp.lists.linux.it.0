Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 484AA11BDB3
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 21:16:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B086C3C1C8D
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 21:16:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 850E53C17C4
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 21:16:04 +0100 (CET)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 38ABE14017CA
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 21:16:04 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id b11so8636249wmj.4
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 12:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iFoM+5LsfRPL8+fWbdUyYWCVjYBV+sR1k1HpukeClbs=;
 b=IpAffQ+NA1IPN3ePwzuNWOz/k3Q1ZFk8PYsKcNC0usFrTKGKu+nhq2wotQ63Huxc7q
 0SPih/x8ACn9gr7nKnYY0cdOpE8qwI1CW9LScMCNEs8C5WCBd5mBcRpBjYZFYmD5brYP
 RvTDjDgv+al3HewFSVysJEoeNwLKgDwyijD/1hNzhWdIJh63yv9340Cef7tp7TPgve7w
 gRaquW/kZJ96PmlPooRNwe/3acIlHz3LBvuA2M+N+GIMvbMmHniTSnvNUeZtT928EBRF
 Y64CCAxT1k/wJ0aenpG+eyew5oU0F0H6FRr63uNzemi0KytcI9P+Vz6KJlIE3rFwNcAa
 Th5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=iFoM+5LsfRPL8+fWbdUyYWCVjYBV+sR1k1HpukeClbs=;
 b=KzD/nxNPtqkP/7fB9w0Td1JaTTrw+nkhK4zZ2XCYXzSaY/IKD1tdtb5V9FV2vokrJV
 vkXDG4sl0LENY8nLr4jVug7jOKQyXKHW4UYu/Pf4xRAkga2M8nI+sGLXDQ8JazvURlM0
 wfZ5PTCxad1/Pktx5u+7xGbfZsa0y/t/g9TW7LnVls0qMGEf+9qnCGUzlu9hdHaWfnpe
 cL/LUiAuKkda30EbekY0aK0DKgCELMlmp9v2KEK/+6CtOv8sLQEB/T6g+4GVKdfOm9Zo
 n0vPijQictskHOb862MfOJlndafPqsduQFhRhjNyx1r1C6fkb4DnGTIwWPGma6anbosc
 Ru8w==
X-Gm-Message-State: APjAAAW5gmkXotfxBB8sVw0JK5yYfLUE47RU4g4nBIG3Tj2eUPfHbBTA
 rkSLFrk72g/nlW3HzbVTnXU=
X-Google-Smtp-Source: APXvYqybHO/qNp2LjNsX2L1YfnaeBv8w56EdYOGydXwUiKSvkoVrfzdD1Q+4HhxhNAd7LfT4RGC9IA==
X-Received: by 2002:a05:600c:2218:: with SMTP id
 z24mr1885945wml.50.1576095363849; 
 Wed, 11 Dec 2019 12:16:03 -0800 (PST)
Received: from x230 ([62.168.16.220])
 by smtp.gmail.com with ESMTPSA id w22sm3323567wmk.34.2019.12.11.12.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 12:16:03 -0800 (PST)
Date: Wed, 11 Dec 2019 21:16:00 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191211201600.GA87570@x230>
References: <20191210201321.1430984-1-petr.vorel@gmail.com>
 <1509318407.16168104.1576069693282.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1509318407.16168104.1576069693282.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] musl: travis build and include fixes
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

> > although LTP not yet fully support musl, I'd like
> > to add travis build via Alpine linux distro.
> > Remaining broken tests are deleted before building,
> > I volunteer to solve musl problems for new code.

> Fine by me, we can always disable it later if we run into (too many) issues.

> > I also added 2 simple RPC fixes.

> LGTM. As for RHEL, socketvar.h appears to be unused for decade at least.

Thanks a lot for a review, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
