Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D48A1EE44B
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 16:55:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 53F803C24DF
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 16:55:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 610703C2417
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 16:55:14 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id B143B1A00FB7
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 16:55:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572882912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DL2IG9AbNvZ/li3z40IBmvR8wTFQkn3xZOZ2GqIVhd0=;
 b=bisycXmj4IxgAd+ozEn+LQw8sJRABHnF5h43gHsqgBV2U2vMUlliqyr+CKOdWD9EEi+bwZ
 dmYA4tdhB1G4A3wzqECwlov9EWB46H9lUWRBoBSmVPcYZyv86kLqV6uKnjRV0QuurkXEaK
 IhU8Ug7ckxxG9ZYd0+kBFoR+aqC7LjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-rW3kzpKKPq6OLIjYvbj6lA-1; Mon, 04 Nov 2019 10:55:08 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6F781005500;
 Mon,  4 Nov 2019 15:55:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97C2F5C1B2;
 Mon,  4 Nov 2019 15:55:07 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82CB64BB5C;
 Mon,  4 Nov 2019 15:55:07 +0000 (UTC)
Date: Mon, 4 Nov 2019 10:55:07 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <268062442.10361445.1572882907300.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191101071244.GA4930@dell5510>
References: <a5174e749dd7b6089fa861b5369baf9f80c51ef8.1572269566.git.jstancek@redhat.com>
 <20191101071244.GA4930@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.23]
Thread-Topic: pt_test: skip pt_disable_branch on Broadwell CPUs
Thread-Index: p9vC5z/M3a0sfAOh29itxWkpNUUmkw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: rW3kzpKKPq6OLIjYvbj6lA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pt_test: skip pt_disable_branch on Broadwell CPUs
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
Cc: ammy yi <ammy.yi@intel.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi Jan,
> 
> > commit d35869ba348d ("perf/x86/intel/pt: Allow the disabling of branch
> > tracing")
> > disallows not setting BRANCH_EN due to erratum BDM106 on Broadwell CPUs.
> 
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

Pushed.

> 
> ...
> > @@ -145,6 +171,11 @@ static void setup(void)
> >  	attr.size	= sizeof(struct perf_event_attr);
> >  	attr.mmap			= 1;
> >  	if (str_branch_flag) {
> > +		if (is_affected_by_erratum_BDM106()) {
> > +			tst_brk(TCONF, "erratum BDM106 disallows not "
> > +				"setting BRANCH_EN on this CPU");
> I'd join string (to be on single line), even it's longer than 80.
> (better for grep)
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
