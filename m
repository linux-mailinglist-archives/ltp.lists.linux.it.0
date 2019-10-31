Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1F6EB223
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 15:08:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C3873C2341
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 15:08:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6B85C3C147F
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 15:08:20 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 05D561A013AF
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 15:08:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572530898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WPBLsfh+hj5qK6s4B4qdJ1gq83fEOmxzP9EatuPkidg=;
 b=RFmBBL1vUd+fqBfVqIZ68bdqO6eoRhkf44iMG9+rNKJ4YPMg4Gq6QZ0kEplzm91kwaRYRQ
 A/pDsvprPUYX0wBUtDPaz/eslbt7V9tCbwrdhLp8c4KX3hup9aEyRWzdTA5c0RSl9ucq9y
 u+AJxcZa+ryx7qHISDudJ7uNIU6vKHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-0tV_9V64OxWaPQ_SBnwKOg-1; Thu, 31 Oct 2019 10:08:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 911961800D55
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 14:08:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88B525D6D6
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 14:08:12 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 818534BB5C
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 14:08:12 +0000 (UTC)
Date: Thu, 31 Oct 2019 10:08:12 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: LTP List <ltp@lists.linux.it>
Message-ID: <1646437889.9970187.1572530892483.JavaMail.zimbra@redhat.com>
In-Reply-To: <tencent_01F277DA0DC3756E3C6BE5D9@qq.com>
References: <tencent_4D69C182358CFFEA3F0A95F7@qq.com>
 <1615187401.9901286.1572514591876.JavaMail.zimbra@redhat.com>
 <tencent_28D2BF821D50F4EC33C1EF97@qq.com>
 <246485198.9905451.1572515620925.JavaMail.zimbra@redhat.com>
 <tencent_01F277DA0DC3756E3C6BE5D9@qq.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.1]
Thread-Topic: Unable to run eventfd test,
 even the libaio-dev installed on debian 10.
Thread-Index: y4kK/B9m/E+0ydut/L3UJdeA/1pd7w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 0tV_9V64OxWaPQ_SBnwKOg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Unable to run eventfd test,
 even the libaio-dev installed on debian 10.
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



----- Original Message -----
> It works, thanks a lot.

Reporter answered privately it's resolved.

>
> > Above looks OK. Please do also "make clean" on everything, just to be sure
> > you're not using old binaries. I don't see eventfd01 being rebuilt in your
> > first email.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
