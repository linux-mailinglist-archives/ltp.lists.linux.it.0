Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 808EF211FA4
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 11:18:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D1173C1D76
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 11:18:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id EE8833C088F
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 11:18:38 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 3F2A31000975
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 11:18:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593681516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLpFLCuafe4iyrBQxVUcvx3TH1OY7wIzHXhGzwOdnuM=;
 b=WkKW58oonVLdViVEegBsajSo2Zwrj88Noa0+EMgZ0XSl9m44zfznvYt/xGhVlHjwSNLWoI
 JSCFFIQuz/pg/IBqXxMyYJs5qUm5XOt2FIeAwPqKqgeS+QvonoDRkShxH4/9thjOnNJLa1
 sV8XCB/7Tql55Q4iB+teGaORmun3tPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-dvVhiKieNM-K2AJFcVEp6g-1; Thu, 02 Jul 2020 05:18:34 -0400
X-MC-Unique: dvVhiKieNM-K2AJFcVEp6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84DCA108BD0C;
 Thu,  2 Jul 2020 09:18:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 580ED79225;
 Thu,  2 Jul 2020 09:18:33 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2167D1809557;
 Thu,  2 Jul 2020 09:18:33 +0000 (UTC)
Date: Thu, 2 Jul 2020 05:18:33 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, chrubis@suse.cz
Message-ID: <370764327.568888.1593681513002.JavaMail.zimbra@redhat.com>
In-Reply-To: <1593430883-6131-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1904309747.19085433.1593428894028.JavaMail.zimbra@redhat.com>
 <1593430883-6131-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.193.82, 10.4.195.6]
Thread-Topic: tst_device: Add new api tst_find_backing_dev(path, dev)
Thread-Index: p40cwYbfhk83wHnkThMhPxoeSIlifA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
> This api uses stat() to get major/minor devnumber of the path, assign the
> 10th column value to dev when match succeeds in "/proc/self/mountinfo".
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Cyril, any objections to v5?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
