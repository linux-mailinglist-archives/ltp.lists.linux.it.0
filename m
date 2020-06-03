Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E63921ECDC5
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jun 2020 12:43:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE01C3C3284
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jun 2020 12:43:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 3C6D63C232C
 for <ltp@lists.linux.it>; Wed,  3 Jun 2020 12:43:25 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 81C501001264
 for <ltp@lists.linux.it>; Wed,  3 Jun 2020 12:43:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591181004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pUaizYznxtQS/Tcm/VmrtHUi5vAfbOWa1HJkL3P7JSg=;
 b=Fsw6kKESvU8yqTcy9H7NFXlr63t7YTPcTGr5TH647mLUrkD5SqkwtEXw0nmCXZqUX97+oe
 HupfucUlLZCWoxssYGr6qx8kN/mAupPsbNIzQKr0C11LJBFur0wzQgR3iodEtiAkYCV3ZH
 koZ6fDgDtlyY+86TwLcsZgfJsxjXJfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-kJvTNYzFN9qhJJw1qK-Ugg-1; Wed, 03 Jun 2020 06:43:22 -0400
X-MC-Unique: kJvTNYzFN9qhJJw1qK-Ugg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E31C1005512
 for <ltp@lists.linux.it>; Wed,  3 Jun 2020 10:43:21 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85A3B6606D;
 Wed,  3 Jun 2020 10:43:17 +0000 (UTC)
Date: Wed, 3 Jun 2020 12:43:15 +0200
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200603104314.GA12583@janakin.usersys.redhat.com>
References: <20200601100459.32511-1-liwang@redhat.com>
 <1365679659.14324910.1591019831545.JavaMail.zimbra@redhat.com>
 <CAEemH2ffNHY6Ej-Er5a4Ng_9zw+RX+wEBc0widntmYqDLNRqxw@mail.gmail.com>
 <20200602121232.GA22599@janakin.usersys.redhat.com>
 <CAEemH2d7OzG6jBZ15bYGRHm7ry-gVjzuwJYhbHp3yitB3_928w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEemH2d7OzG6jBZ15bYGRHm7ry-gVjzuwJYhbHp3yitB3_928w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] lib: add new cgroup test API
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

>> >And the worth to say, the random directory name for same cgroup
>> >mounting is also on purpose, though we mount same(i.e memory)
>> >cgroup in two places it still belongs to the one hierarchy, and create
>> >the same name of the new directory will be hit an error in EEXIST.
>> >
>> >static void tst_cgroup_set_path(const char *cgroup_dir)
>> >{
>> >    ...
>> >    sprintf(tst_cgroup_mnt_path, "%s", cgroup_dir);
>> >    sprintf(tst_cgroup_new_path, "%s/ltp_%d", cgroup_dir, rand());
>>
>> I see why you are tracking this in list, but this exchange of state through
>> global variables does seem bit unclear.
>>
>
>Yes, that's a compromise to support more usage of the APIs.

I don't get why global variables are necessary.
tst_cgroup_mnt_path is always same as cgroup_dir parameter passed to all functions.
tst_cgroup_get_path() could return pointer to tst_cgroup_pathes->new_path,
  (you just need you call umount before del_path)
tst_cgroup_ctl_knob is set before each use, so it could be local variable too.

>I have no strong preference to shift from v2 to this method, or maybe we
>can try
>to combine together and do more optimize work in the lib side.

Sounds like we could use 3rd opinion.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
