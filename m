Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D651D4D7C
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 14:11:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01A523C53AD
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 14:11:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id F36EC3C2674
 for <ltp@lists.linux.it>; Fri, 15 May 2020 14:11:46 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 71491601EB2
 for <ltp@lists.linux.it>; Fri, 15 May 2020 14:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589544704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qzb2kkesBSUW75oX6PiXjUGtclmaMAqr8hLwATqGyvU=;
 b=IjCjVEcpMUedVy7r5KGpMhgAvZRaG/J04Ok09ufN/TOqzSvaqqhiEJyHam7QkfrJshnf/1
 E6c6U+FPLG/V3kbPxZpsOVqk8f5wcOClgP7LnM4k511t0XFewK+XF6BcjwYPtOmT2tvsYF
 yZtGsI3ZYioqlUCThnIqKyNjf00w43Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-bLzp_gymMm66VbhycULh7w-1; Fri, 15 May 2020 08:11:42 -0400
X-MC-Unique: bLzp_gymMm66VbhycULh7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E31E3801503;
 Fri, 15 May 2020 12:11:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCEBD1C8;
 Fri, 15 May 2020 12:11:41 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D60CD18095FF;
 Fri, 15 May 2020 12:11:41 +0000 (UTC)
Date: Fri, 15 May 2020 08:11:41 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1312029153.12581498.1589544701639.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200515093216.829-1-pvorel@suse.cz>
References: <20200515093216.829-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.1]
Thread-Topic: Update installation docs
Thread-Index: oaRVahsZoQlBBbZ1/ipPDvmZltiRkg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 0/4] Update installation docs
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
> Hi,
> 
> changes v3->v4:
> * improve note about other library dependencies in 1st commit (Jan)
> * remove also "What's in a Path?" in 3rd commit
> 
> It'd need more cleanup, but enough now :).

ACK


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
