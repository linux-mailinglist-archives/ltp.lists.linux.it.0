Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AAA1F3CA4
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 15:33:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 656A33C2E57
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 15:33:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4A0C13C2E47
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 15:33:28 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 5B618601A71
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 15:33:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591709606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bi9GTTywwq8UCtxW9CtR/Ee1li4iqf01TRq9flrWdvc=;
 b=O8vS708kq9XFteiAfSY6EE8x9r3WqAdpHkoYoYkPESNe/WSNztXxuI2ffpU/9m0B9S7OP+
 HHUU1VA9S9uzl8ngdkt9LCgJrzyRT70pi+OFjECWwWxH0paK1bC4dtT/T/OBJ5bp1di48/
 SlDfF6rQjgvrYdL35Nv7H2v2JTh/O3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-IagQwQjKPPqmj_uADMC5sA-1; Tue, 09 Jun 2020 09:33:24 -0400
X-MC-Unique: IagQwQjKPPqmj_uADMC5sA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDF83107ACF4;
 Tue,  9 Jun 2020 13:33:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E739F4B;
 Tue,  9 Jun 2020 13:33:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BF49B3495;
 Tue,  9 Jun 2020 13:33:23 +0000 (UTC)
Date: Tue, 9 Jun 2020 09:33:23 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: rpalethorpe@suse.de, Li Wang <liwang@redhat.com>
Message-ID: <1521498136.15325724.1591709603454.JavaMail.zimbra@redhat.com>
In-Reply-To: <877dwgxv96.fsf@our.domain.is.not.set>
References: <33c4abf347e2de96f89b9acea02d731e47dbf2a9.1591700131.git.jstancek@redhat.com>
 <877dwgxv96.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.23]
Thread-Topic: read_all: scale down how many times we read by default
Thread-Index: VCn6W4LtHeVXw2fa1BPCznhklgSU4g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] read_all: scale down how many times we read by
 default
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
> OK this makes sense. We shouldn't be stress testing the system in this
> runtest file.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
