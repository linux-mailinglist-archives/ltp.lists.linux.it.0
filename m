Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CBA14C7CF
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 10:05:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECF383C2567
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 10:05:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EC0463C238D
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 10:05:25 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 032811A0152D
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 10:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580288723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qELJ9ssRM83TQWS76J0nGd7jILvM0UBJ/DV0GGQ/ZY=;
 b=K8a+W/JqaR+Ctxx7hpKZqb/nXAfPxVit+6rvF/3AQ2R4ROzHaBlIZwTp3JX99uzhAPklkK
 cma1BxncmDXhE8lmLJRzrf+e1VWkQE9zbBoFOrPiNt+ILdz4Ez2S7O/lJPeS41JD9uHr8q
 Qqn57REQZSJFFz1ue7Hx8JPAN9a33Nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-13hd-uOxP3aavF1L_oUa_A-1; Wed, 29 Jan 2020 04:05:21 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C3FE800D55;
 Wed, 29 Jan 2020 09:05:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8270484BC4;
 Wed, 29 Jan 2020 09:05:20 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A019618089C8;
 Wed, 29 Jan 2020 09:05:19 +0000 (UTC)
Date: Wed, 29 Jan 2020 04:05:19 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1673538745.4724463.1580288719426.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200128135401.GE26365@rei>
References: <7a2d56fa03583ca7979cbe22a61ac648b3d6b6eb.1579877813.git.jstancek@redhat.com>
 <20200128135401.GE26365@rei>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.3]
Thread-Topic: max_map_count: use default overcommit mode
Thread-Index: gBE/zmgTub5K5AYIcD8J4llGd/TUJg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 13hd-uOxP3aavF1L_oUa_A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] max_map_count: use default overcommit mode
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
> Sounds reasonable to me, acked.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
