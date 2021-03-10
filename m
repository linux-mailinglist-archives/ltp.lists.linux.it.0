Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4507C333CE7
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:55:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC0423C6A35
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:55:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7D9693C4B91
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:55:24 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 08765600196
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:55:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615380922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPCjYCqMvSzhKjPXXqdyieIvAV2/j0L73QhlRUm+EAY=;
 b=DuJnofbHh5Cc42vkodNruuecaMv2BrTvtLqY5vP44iPWrmrFJs9TIzgbTaIpykhxNyaPaJ
 lNYrihQSHZ1tRRquY+5vS0JNbtf3elFpLoJUwHCC2cTVwGIEWeLC8GoPNB7YGjimgrSf0C
 nwqEgtSDkoE77obBla6cO9eGjaGOqoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-77e7z8sWNPil8N6sTAP-vg-1; Wed, 10 Mar 2021 07:55:21 -0500
X-MC-Unique: 77e7z8sWNPil8N6sTAP-vg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F19457;
 Wed, 10 Mar 2021 12:55:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 175175D746;
 Wed, 10 Mar 2021 12:55:19 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5B2557DC0;
 Wed, 10 Mar 2021 12:55:19 +0000 (UTC)
Date: Wed, 10 Mar 2021 07:55:19 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1320332024.40018791.1615380919351.JavaMail.zimbra@redhat.com>
In-Reply-To: <20210310122625.25425-1-chrubis@suse.cz>
References: <20210310122625.25425-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.15, 10.4.195.1]
Thread-Topic: Add proper filesystem skiplist
Thread-Index: i6gC6g/aMtURXSz51FJWJa7kwvCVgQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
> This adds a proper .skip_filesystems array to the tst_test structure and
> implements support for both test with .all_filesystems enabled and
> disabled.
> 
> As a bonus point we get the list of filesystems that the test does not
> support exported to the metadata as well.

Ack. Can you please also add something to docs?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
