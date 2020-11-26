Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8CB2C53A0
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 13:11:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56EC13C4E30
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 13:11:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 072653C14BC
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 13:11:27 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 29C23200046
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 13:11:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606392685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGGMqYpegdZi/BqIkyCSCZoE0EoHDeZNeoCsOz0WhQ4=;
 b=PnqDiNY4fIntNuvvFvcbRTn9IXUwsY99GAmJEI1C1karHvzQNczNEfTR/fkdg87ctFwXeM
 r3rxZ89zERzmMi5NkBOrTEony4zIrTpZCGBwyXjqjjfHKCFki6XISVcepOwfPHQMHnGO/2
 9J8F8HGHAkRbZ77TCt/29v2G2qRzwI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-xK4E_QB8O9eTx3-uy5obbQ-1; Thu, 26 Nov 2020 07:11:23 -0500
X-MC-Unique: xK4E_QB8O9eTx3-uy5obbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD351180A0AC;
 Thu, 26 Nov 2020 12:11:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4BC35D6AC;
 Thu, 26 Nov 2020 12:11:22 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72BAD18095FF;
 Thu, 26 Nov 2020 12:11:22 +0000 (UTC)
Date: Thu, 26 Nov 2020 07:11:22 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <554539421.26128431.1606392682294.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201126101344.550472-1-yangx.jy@cn.fujitsu.com>
References: <20201126101344.550472-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.76, 10.4.195.24]
Thread-Topic: travis: Remove obsolete CentOS 6
Thread-Index: Z6x4bCbSLyNeWUpvzyDu/wHB9fojMA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] travis: Remove obsolete CentOS 6
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> We are planning to remove the support of old distros(e.g. CentOS 6).
> 
> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
