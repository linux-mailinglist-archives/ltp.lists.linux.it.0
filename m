Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14E24D1AE
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 11:46:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9C023C2F78
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 11:46:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id DE86A3C13D8
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 11:46:02 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 59C9E200AEF
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 11:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598003160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bzq4BYt4sI5L8kf6069iGM1MOzX2jryvgY94FD3+Cw=;
 b=MN1kOcJ/OdU1pITw1niLOXpjNRi8BG+5/mDVCpVV/mdpcSdTRthUyMBeXkEl3eKtEpIvWK
 xOxZUPy43HEwSF2zftwUz2P/qo+s3aycFnyTUS1hrf8ftK+LoqBN06CJAPf3Q6mwvbirPZ
 /YKGhpR55W+2YYsz7j7cYq37BxoY3AM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-MiAlVffXO0yqAgrUoiQkmQ-1; Fri, 21 Aug 2020 05:45:55 -0400
X-MC-Unique: MiAlVffXO0yqAgrUoiQkmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDB401902EA1
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 09:45:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7977600DD
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 09:45:54 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1EAC181A050
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 09:45:54 +0000 (UTC)
Date: Fri, 21 Aug 2020 05:45:54 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: LTP List <ltp@lists.linux.it>
Message-ID: <277259633.9648166.1598003154755.JavaMail.zimbra@redhat.com>
In-Reply-To: <1053136797.9144539.1597819054047.JavaMail.zimbra@redhat.com>
References: <94883604.6936811.1596720770623.JavaMail.zimbra@redhat.com>
 <1929570063.6965184.1596736053281.JavaMail.zimbra@redhat.com>
 <20200818022905.GB2507595@T590>
 <1382840777.8967687.1597731548544.JavaMail.zimbra@redhat.com>
 <1053136797.9144539.1597819054047.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.12]
Thread-Topic: mkfs.ext[23] hangs on loop device (aarch64, 5.8+)
Thread-Index: Jl48YJuhCHipj59WvXfhgmpRaHsfw1tbw9/qchpz81c=
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] Fwd: [bug] mkfs.ext[23] hangs on loop device (aarch64, 5.8+)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > ----- Original Message -----
> > > I saw this kind io hang in ltp/fs_fill test reliably and the loop is
> > > over image in tmpfs:
> > > 
> > > https://lkml.org/lkml/2020/7/26/77
> > > 
> > > And I have verified that the following patch can fix the issue:
> > > 
> > > https://lore.kernel.org/linux-block/bc5fa941-3b7c-f28e-dd46-1a1d6e5c40a8@kernel.dk/T/#t
> > 
> > Thanks, I'll test your patch with my setup.
> 
> I've seen no hangs over past ~24 hours with patch above.
> 
> Thanks,
> Jan

fyi, in case you see sporadic I/O hangs, usually while running LTP tests
that make use of loop device with recent upstream kernels:
  https://lore.kernel.org/linux-block/1929570063.6965184.1596736053281.JavaMail.zimbra@redhat.com/


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
