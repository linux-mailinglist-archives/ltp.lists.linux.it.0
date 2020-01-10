Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D874F137152
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:32:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82AF53C25A6
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:32:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 777863C24E9
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:32:49 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A76F820009A
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:32:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578670367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TemP6fyTRH0MTKf3Fnsx9urI1kdRWaHjeMoEYhAUCs=;
 b=OBpYHzVV8OdU8zMUIIUIV4ocDplyKzHFld+tHDJMhbW84IZxLxftWB1aMLMx4c7b3lBOmE
 oHlUFHe6mN0q/uMlksUGoocVXKqhIoehhBb9iVUUiD5Y9VEDrz0yhPkQxvGBOs2Sofyep6
 PDOzX1kBVAhWpUKYMWzQK04CtQiSS7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-MBAydAloPOuqVnMRio1_qQ-1; Fri, 10 Jan 2020 10:32:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61CBC18557C2;
 Fri, 10 Jan 2020 15:32:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5854119C6A;
 Fri, 10 Jan 2020 15:32:42 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BFB0503D3;
 Fri, 10 Jan 2020 15:32:42 +0000 (UTC)
Date: Fri, 10 Jan 2020 10:32:42 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <888974477.1402999.1578670362098.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200110152607.GB23359@rei.lan>
References: <20200110151443.212842-1-pvorel@suse.cz>
 <20200110152607.GB23359@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.10]
Thread-Topic: tst_device: use raw syscall in the tst_device.h
Thread-Index: ztm8eGZ3OlID/I5mdGWogBTmPume0Q==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: MBAydAloPOuqVnMRio1_qQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_device: use raw syscall in the
 tst_device.h
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
> > tested on
> > https://travis-ci.org/pevik/ltp/builds/635305638
> > 
> > Please anybody ack and merge, so we can move on with merging other
> > things before git freeze.
> 
> Acked once and if the travis run finishes green.

Ack, looks good on RHEL too (6.10/7.8/8.1).


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
