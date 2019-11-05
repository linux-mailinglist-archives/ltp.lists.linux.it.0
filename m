Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E6EFE05
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:12:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25ACE3C22CD
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:12:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 551103C22BD
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:12:26 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D0D4E1A000B0
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:12:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572959544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dwzyGOpFb3SGO6MKEyykG+Y468Hk/OxyldaXq0uVomU=;
 b=fjm209yXS1CI26zJc/y1AJ6T3l28Ti+nK7wEes1cjJ+LQmkvdiwAp7pOD4Q/IAhzJVi2rq
 Y0eIYniFtVBdVPh9LusoQs47jP6Leu+jo9eIkWsIMQcJBAwN9ja3M1ZQ1t90wNLjZfRp1r
 KXa8u/nHnhYnQaBx9IN9T8ah/lQDdN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-m59PpJbbOVyCfB7kG7sMcg-1; Tue, 05 Nov 2019 08:12:22 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60E55107ACC3;
 Tue,  5 Nov 2019 13:12:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 579CC5D70D;
 Tue,  5 Nov 2019 13:12:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B6C24BB5B;
 Tue,  5 Nov 2019 13:12:21 +0000 (UTC)
Date: Tue, 5 Nov 2019 08:12:21 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <937999891.10536811.1572959541272.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191105123849.GA8511@rei.lan>
References: <4647b3bced96c66c040078a32c13dab65558816d.1572956488.git.jstancek@redhat.com>
 <20191105123849.GA8511@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.2]
Thread-Topic: read_all: move blacklist to source
Thread-Index: 6Cn3WOhzxuLaH84ALv3rKc5pQEnkTQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: m59PpJbbOVyCfB7kG7sMcg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] read_all: move blacklist to source
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
> 
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
> 

OK to push both, or is this only for first patch?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
