Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA1FB969
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 21:08:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A484A3C2276
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 21:08:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 708A23C1C91
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 21:08:30 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7D0702009CB
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 21:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573675708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yiqkNiqpP6d7uUucKyT1BEJUvu4UNnA9guBelxVM+Ok=;
 b=O4C2nMJ+kN/b01zYvWFyqjb1WZ+zZ1ki1QecECfdCgazdXxNamutAEukiOBrM4A+RZRlZM
 qhSb/U2B1Ai/Ak/tT5d5DHQSjm0bmqy4NPkFickLGVthgLeGpUPS93XVoFhwS9m3taucEJ
 /g+KBCNb64ZV5pJvtJfX5hZPqEtmsKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-gOiIQ-DKNhaQlOz_SWXOGA-1; Wed, 13 Nov 2019 15:08:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFE571927C48;
 Wed, 13 Nov 2019 20:08:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A54875E25B;
 Wed, 13 Nov 2019 20:08:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AFF04BB65;
 Wed, 13 Nov 2019 20:08:23 +0000 (UTC)
Date: Wed, 13 Nov 2019 15:08:23 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
Message-ID: <1083353554.12008468.1573675703591.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191113092510.GA31052@rei>
References: <95d94fede00533a07fc604de3252636b094fc8f8.1573550061.git.jstancek@redhat.com>
 <20191113092510.GA31052@rei>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.214, 10.4.195.28]
Thread-Topic: acct02: relax ac_btime checks
Thread-Index: Actui8DkriCnj66SSJ9X53MjvoLMpA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: gOiIQ-DKNhaQlOz_SWXOGA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] acct02: relax ac_btime checks
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
> Looks good, acked as well.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
