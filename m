Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B3104EA6
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 10:01:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADB873C1CA4
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 10:01:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CFBD63C1C86
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 10:01:26 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 3577C20A6DD
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 10:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574326884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyfDluXa/65dIGVcouxeBOTcm5lQP2BH0z/kvpk4lEg=;
 b=X0ZLZAZeS+83KP+l8nA9R2VaUFz0HE7IPYrRNQvgPSG6cd/2iQ7JvbmBF90CKjalnu696m
 MhrOmvAKg8JPOEER0rCFxK/Bwg36zw3XkFSgDeNqnzpWPTadH1kv38BNn5QCHy6dniKg+5
 1xx6Lqt2iiHV5SDHJK4/6nkQY9niKn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-s93QfdyoOWWDokLV0EwG3w-1; Thu, 21 Nov 2019 04:01:17 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48449477;
 Thu, 21 Nov 2019 09:01:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE4C60BC3;
 Thu, 21 Nov 2019 09:01:16 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2634E1809563;
 Thu, 21 Nov 2019 09:01:16 +0000 (UTC)
Date: Thu, 21 Nov 2019 04:01:15 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1893160007.13287158.1574326875945.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191120151244.GA28197@dell5510>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.21]
Thread-Topic: syscalls/quotactl01: Add Q_GETNEXTQUOTA test
Thread-Index: D3AkaVk1DYl4LugZR2jzA95OBAnjTw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: s93QfdyoOWWDokLV0EwG3w-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/quotactl01: Add Q_GETNEXTQUOTA
 test
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
> @Jan, @Cyril: Do we want to generally avoid loading <linux/types.h> if not
> really needed?

Yes, we generally try to avoid including kernel headers. Our style-guide says
"Don't use +linux/+ headers if at all possible". uapi on older distros
was more prone to cause LTP build errors.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
