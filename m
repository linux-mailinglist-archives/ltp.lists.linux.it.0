Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C1E212465
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 15:18:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC2163C2A5D
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 15:18:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 10EB53C088F
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 15:17:57 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 862941001895
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 15:17:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593695875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QJVs7VA5F/CULbhuOE91G/aHX+yb11usDuAMg4HFTb0=;
 b=FPt7OKNVBYSaR/ZVOmrMpFmiTsgq6hLhMsT5KGTF1Bc9F3ip62ZvD3eR6tW4G4LX+D7OhR
 0bsTzmb/1ZKKuuhioOD7bL0zmk+iaDtByiPFNizHCOWJXCRp5S5OGvz3VC/BGLTaT0k2Gd
 +o2SzxhEIdlO8kZwjTjKxY/+S/WdjRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-zajYw4H9O9yjik6iqAJRRw-1; Thu, 02 Jul 2020 09:17:42 -0400
X-MC-Unique: zajYw4H9O9yjik6iqAJRRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E9928015FA;
 Thu,  2 Jul 2020 13:17:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 473131010404;
 Thu,  2 Jul 2020 13:17:41 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FEF96C9C6;
 Thu,  2 Jul 2020 13:17:41 +0000 (UTC)
Date: Thu, 2 Jul 2020 09:17:41 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1534761957.602642.1593695861092.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200702122728.GB9101@yuki.lan>
References: <1904309747.19085433.1593428894028.JavaMail.zimbra@redhat.com>
 <1593430883-6131-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <370764327.568888.1593681513002.JavaMail.zimbra@redhat.com>
 <20200702122728.GB9101@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.40.193.82, 10.4.195.23]
Thread-Topic: tst_device: Add new api tst_find_backing_dev(path, dev)
Thread-Index: bl/luoMhEkuUkfAEFSe+AM8uK3Mb2g==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/2] tst_device: Add new api
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

----- Original Message -----
> Hi!
> > > This api uses stat() to get major/minor devnumber of the path, assign the
> > > 10th column value to dev when match succeeds in "/proc/self/mountinfo".
> > > 
> > > Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> > 
> > Cyril, any objections to v5?
> 
> Looks good, Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Thank you, pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
