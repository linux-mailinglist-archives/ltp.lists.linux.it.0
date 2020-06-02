Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D681EBB50
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 14:12:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A3B43C3035
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 14:12:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3D1763C2315
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 14:12:45 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 9A1736002CE
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 14:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591099962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t6L495JUCpBZgJjbKP5tkI5h1hJB4sAeD1wYBfPldBA=;
 b=fNfPUSZ/ayca508t+jwv1P6s3pZeuIBjEGV1pj7qNFwjm5K80UJlPl1PCSYllfTo14tu/y
 v2DMNXi+oKkeFjmgZE6ya/vL3izCfiWdnj7qP/6EJiI6ZR4bZUHYXDKzzo6bPEDfs8hlSG
 9KYmk1eyHCpQzS6pnMOVKgfGEQ8RuzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-h-xj9rWXMiSPQDVI0otiGw-1; Tue, 02 Jun 2020 08:12:41 -0400
X-MC-Unique: h-xj9rWXMiSPQDVI0otiGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0DB71800D42
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 12:12:38 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E9FD19D71;
 Tue,  2 Jun 2020 12:12:35 +0000 (UTC)
Date: Tue, 2 Jun 2020 14:12:33 +0200
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200602121232.GA22599@janakin.usersys.redhat.com>
References: <20200601100459.32511-1-liwang@redhat.com>
 <1365679659.14324910.1591019831545.JavaMail.zimbra@redhat.com>
 <CAEemH2ffNHY6Ej-Er5a4Ng_9zw+RX+wEBc0widntmYqDLNRqxw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEemH2ffNHY6Ej-Er5a4Ng_9zw+RX+wEBc0widntmYqDLNRqxw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

Hi Li,

>Why we need this? Because, if a testcase(i.e oom05.c) needs more than one
>cgroup
>subsystem(memory, cpuset) on RHEL7(cgroup-v1), it should mount two
>different
>directories and do some knob setting.

Mounting with different controllers is fine, I meant do we have a case for mounting
same controller multiple times? We might have, because current design allows
only for single directory (tst_cgroup_new_path), that's automatically created on mount.
(This is your example 4)

>
>
>>
>> > +
>> > +static void tst_cgroup_set_path(const char *cgroup_dir)
>> > +{
>> > +     struct tst_cgroup_path *tst_cgroup_path, *a;
>> > +
>> > +     if (!cgroup_dir)
>> > +             tst_brk(TBROK, "Invalid cgroup dir, plese check
>> cgroup_dir");
>> > +
>> > +     sprintf(tst_cgroup_mnt_path, "%s", cgroup_dir);
>> > +     sprintf(tst_cgroup_new_path, "%s/ltp_%d", cgroup_dir, rand());
>> > +
>> > +     /* To store cgroup path in the shared 'path' list */
>> > +     tst_cgroup_path = SAFE_MMAP(NULL, (sizeof(struct tst_cgroup_path)),
>> > +                     PROT_READ | PROT_WRITE, MAP_ANONYMOUS |
>> MAP_SHARED, -1, 0);
>>
>> I'm not sure I understand what is the reason to have tst_cgroup_path. Is
>> it expected,
>> that mount and umount are called by different processes? It might be easier
>>
>
>The shared 'tst_cgroup_path' is necessary especially for mounting
>different cgoups in setup(). Otherwise, it would be easy to get lost
>which directory for kind of cgroup type.

But why is it shared? Is cleanup going to run in different process context?
Which one of your examples needs shared memory?

>
>And the worth to say, the random directory name for same cgroup
>mounting is also on purpose, though we mount same(i.e memory)
>cgroup in two places it still belongs to the one hierarchy, and create
>the same name of the new directory will be hit an error in EEXIST.
>
>static void tst_cgroup_set_path(const char *cgroup_dir)
>{
>    ...
>    sprintf(tst_cgroup_mnt_path, "%s", cgroup_dir);
>    sprintf(tst_cgroup_new_path, "%s/ltp_%d", cgroup_dir, rand());

I see why you are tracking this in list, but this exchange of state through
global variables does seem bit unclear.

Could we leave "new_path" creation to testcase itself? It would give
us more flexibility and we don't have to worry about name collisions.
It also avoids need to mount same controller multiple times
(example 4 in your reply).

Let's assume this is API:

#include "tst_cgroup.h"
#define MEM_MNT  "/tmp/cgroup1"
#define CPUSET_MNT  "/tmp/cgroup2"
#define DIR1 "ltp_test_blah_dir1"
#define DIR2 "ltp_test_blah_dir2"
#define DIR3 "ltp_test_blah_dir3"

static void run(void)
{
    if (fork() == 0) {
        tst_cgroup_move_current(MEM_MNT, DIR2);
        // do your test
        exit(0);
    }
    tst_cgroup_move_current(MEM_MNT, DIR1);
    // do your test
}

static void setup(void)
{
    tst_cgroup_mount(TST_CGROUP_MEMCG, MEM_MNT);
    tst_cgroup_mkdir(MEM_MNT, DIR1);
    tst_cgroup_mem_set_maxbytes(MEM_MNT, DIR1, 1*1024*1024);
    tst_cgroup_mkdir(MEM_MNT, DIR2);
    tst_cgroup_mem_set_maxbytes(MEM_MNT, DIR2, 2*1024*1024);
    
    tst_cgroup_mount(TST_CGROUP_CPUSET, CPUSET_MNT);
    tst_cgroup_mkdir(CPUSET_MNT, DIR3);
    tst_cgroup_move_current(CPUSET_MNT, DIR3);
}

static void cleanup(void)
{
    tst_cgroup_umount(MEM_MNT);
    tst_cgroup_umount(CPUSET_MNT);
}

static struct tst_test test = {
    ...
    .test_all = run,
};

On library side we would have a list that tracks all mounts. And every mount
record would have list that tracks all mkdir() operations, so we can
cleanup anything that test creates. I think tracking per-process would be sufficient.

(without spinning v3) What are your thoughts?

Regards,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
