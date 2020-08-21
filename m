Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0177124D1A6
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 11:42:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3F833C2F7B
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 11:42:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B199C3C13D8
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 11:42:48 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 29D4D1A00CC6
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 11:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598002966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ILdF7edjwx1c9QbmN9ThsFoEggem7/yn9MP2IeZpIJ8=;
 b=h/SGkYPXNjIZai4lkunIcOfON0QB18kb1IJKmNi0gIOjdTdUpyce3FsE1jMZo8uauHbb3V
 9km0Iuv3DMwp/9KOCWHL1tuStdPXGwD3PsHocis6xmOvihCoUytigy4RhglSNLWNndXOBz
 /5JywZfGuT6pFV5k0ZK34cgcB7OhK3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-e0VmvZcDP1KRGNczeznMdw-1; Fri, 21 Aug 2020 05:42:45 -0400
X-MC-Unique: e0VmvZcDP1KRGNczeznMdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FF131902EA1;
 Fri, 21 Aug 2020 09:42:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 098597191C;
 Fri, 21 Aug 2020 09:42:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A591A662B0;
 Fri, 21 Aug 2020 09:42:43 +0000 (UTC)
Date: Fri, 21 Aug 2020 05:42:43 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <1105431881.9647881.1598002963528.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200819110406.25099-1-mdoucha@suse.cz>
References: <20200819110406.25099-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.12]
Thread-Topic: Taint check: Use TFAIL instead of TBROK in fork_testrun()
Thread-Index: w3cx0IDCITa4KEtisansTQOXLfxLlw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Taint check: Use TFAIL instead of TBROK in
 fork_testrun()
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
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
