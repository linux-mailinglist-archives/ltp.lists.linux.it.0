Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDD816BBFA
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 09:40:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A6A33C25EA
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 09:40:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id ED0DE3C0FC4
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 09:40:25 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 614D61A014D3
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 09:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582620023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13bb3TNbyGYX4N83UJPO58gtvCfKWR9yWzX/feDMEL4=;
 b=buuWEC4g0y2yL+AQ2yS/35HVeQ2D2wFjoRatipszA016+PkYbv6/BDt2dPesZDdDTpY4qG
 tEZYNbB4qbdwplJRdkEHl0aAoFmQzNP7SSn8v+odImYWKCIVoBrhD0vr3aVQMxgQt4y3/s
 mVqqDL0IuVW6oNUqg58hC+aYVv37kbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-Rs1QqBuaO_uJ13ijCadShQ-1; Tue, 25 Feb 2020 03:40:22 -0500
X-MC-Unique: Rs1QqBuaO_uJ13ijCadShQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F0E01005513;
 Tue, 25 Feb 2020 08:40:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 051FA5D9CD;
 Tue, 25 Feb 2020 08:40:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAA52860DC;
 Tue, 25 Feb 2020 08:40:20 +0000 (UTC)
Date: Tue, 25 Feb 2020 03:40:20 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <990931249.8786991.1582620020742.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200225073531.GA64168@gacrux.arch.suse.de>
References: <bac938d8a2d57653b9f22e55c6d222a990b6a5cf.1582301521.git.jstancek@redhat.com>
 <20200225073531.GA64168@gacrux.arch.suse.de>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.9]
Thread-Topic: fputs() in print_result() is not signal safe
Thread-Index: QVq9635Xk9VLiFlcwL//qPDk7YyN2A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: fputs() in print_result() is not signal safe
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
> Hi Jan,
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
