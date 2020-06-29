Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E4320CE14
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:08:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 961443C5737
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:08:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 55A4A3C0781
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:08:29 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9E21B140186D
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593428907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=haycexLXOcxWRKkFhh3NacDbUsVAaempWxpP+wjhxlg=;
 b=Ql6k0alVq2FvClutLBQck59MM6BjjsFanzgA+a3ldrl33qpANYtqbakzu9CtIz5tJrmu2v
 UrKAyt9Qld6c2cUSRQxNxLYXNShCmJWvCjn++8bwXugFg2hCEDK3YwN3LfH/XOJtEYwnlr
 CpL3mcu3URUo728YRkZAeOEFoKBqT9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-wciUjV3mMG6z0kODZahXXA-1; Mon, 29 Jun 2020 07:08:16 -0400
X-MC-Unique: wciUjV3mMG6z0kODZahXXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 564BD1005512;
 Mon, 29 Jun 2020 11:08:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5EA29367;
 Mon, 29 Jun 2020 11:08:14 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43F8A18095FF;
 Mon, 29 Jun 2020 11:08:14 +0000 (UTC)
Date: Mon, 29 Jun 2020 07:08:14 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1904309747.19085433.1593428894028.JavaMail.zimbra@redhat.com>
In-Reply-To: <c11e8d9b-bd16-da32-e9eb-490226f4f4c1@cn.fujitsu.com>
References: <20200624113217.GC30917@yuki.lan>
 <1593330123-19631-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1418968619.19068649.1593417390787.JavaMail.zimbra@redhat.com>
 <c11e8d9b-bd16-da32-e9eb-490226f4f4c1@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.22]
Thread-Topic: tst_device: Add new api tst_find_backing_dev(path, dev)
Thread-Index: CJlrLuJP7wGrm9PI+spPfGYgx0sdtg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] tst_device: Add new api
 tst_find_backing_dev(path, dev)
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

> > You said "But stat function has problem when filsystem uses virtual block
> > (such as btrfs,fuse, then major numer is 0)." - Why is that a problem
> > for comparison against /proc/self/mountinfo?
> > 
> Yes, you are right. I wrongly think btrfs filesystem affects the 10th
> columu value in /proc/self/mountinfo. In actually, it can show the
> correct backing block dev.

I haven't tested your pasted version, but that approach seems better,
since that should work for any path, not just the mount point.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
