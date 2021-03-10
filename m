Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 77435334252
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 17:02:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D92683C6A3F
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 17:02:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D4E1F3C0CC6
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 17:01:59 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E67D01400542
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 17:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j4ZnWLVU5YZnE/E3bkzi/T5KAzCOqVVCl+6L2ivmwYM=;
 b=fUoM3LLkovpsKWbf6LeZX0cn1IUKzcn2qmPhV+mZvK1dyTI/bc+hhPUmW35OCEnQzohN3C
 cVAwHWhm/BDgK15IIS0tW14k0IFNWQ5bM8Yae1830+GNNRYeDSdGms6U0jqRxrU8e3sRCk
 BXELrPZvZdarPk76h4Vhh/1hNNNZNqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-qHWtC5-xPLuo5EObaYM4Pg-1; Wed, 10 Mar 2021 11:01:54 -0500
X-MC-Unique: qHWtC5-xPLuo5EObaYM4Pg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF3761018F74;
 Wed, 10 Mar 2021 16:01:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C450B1002388;
 Wed, 10 Mar 2021 16:01:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B801F18095CA;
 Wed, 10 Mar 2021 16:01:53 +0000 (UTC)
Date: Wed, 10 Mar 2021 11:01:53 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <421964824.40043878.1615392113711.JavaMail.zimbra@redhat.com>
In-Reply-To: <YEjUTK+UlEcK+6Lx@yuki.lan>
References: <20210310122625.25425-1-chrubis@suse.cz>
 <1320332024.40018791.1615380919351.JavaMail.zimbra@redhat.com>
 <YEjUTK+UlEcK+6Lx@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.15, 10.4.195.2]
Thread-Topic: Add proper filesystem skiplist
Thread-Index: H8UtkcK1NXgLSmt/2X83cvImIbuuKQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] Add proper filesystem skiplist
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
> Hi!
> > Ack. Can you please also add something to docs?
> 
> Sure, what about:

lgtm


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
